# Gera o Brasil em blocos (grade) a partir do contorno oficial dos estados.
# Uso:  python3 gerar_mapa_brasil.py estados.geojson PASTA_DE_SAIDA
# Baixe o contorno em: https://raw.githubusercontent.com/codeforamerica/click_that_hood/main/public/data/brazil-states.geojson
# Saídas: MapaBrasil_Dados.lua (dados para o Roblox) e mapa_brasil_preview.png (para ver).
import json, math, sys
from PIL import Image, ImageDraw, ImageFont

GEO, SAIDA = sys.argv[1], sys.argv[2]

PASSO = 0.5                       # graus por célula
LON0, LON1 = -74.0, -28.5
LAT0, LAT1 = 5.5, -34.0
COLS = int(math.ceil((LON1 - LON0) / PASSO))
LINHAS = int(math.ceil((LAT0 - LAT1) / PASSO))
CELULA = 200                      # studs por célula no Roblox (mapa ~18.000 x 15.800 studs)
SS = 10                           # pixels por célula ao desenhar (para amostrar melhor)

REGIAO = {
    "AC": "Norte", "AM": "Norte", "AP": "Norte", "PA": "Norte", "RO": "Norte", "RR": "Norte", "TO": "Norte",
    "AL": "Nordeste", "BA": "Nordeste", "CE": "Nordeste", "MA": "Nordeste", "PB": "Nordeste",
    "PE": "Nordeste", "PI": "Nordeste", "RN": "Nordeste", "SE": "Nordeste",
    "DF": "Centro-Oeste", "GO": "Centro-Oeste", "MS": "Centro-Oeste", "MT": "Centro-Oeste",
    "ES": "Sudeste", "MG": "Sudeste", "RJ": "Sudeste", "SP": "Sudeste",
    "PR": "Sul", "RS": "Sul", "SC": "Sul",
}
CAPITAL = {  # nome, latitude, longitude
    "AC": ("Rio Branco", -9.97, -67.81), "AL": ("Maceió", -9.67, -35.74), "AP": ("Macapá", 0.03, -51.07),
    "AM": ("Manaus", -3.12, -60.02), "BA": ("Salvador", -12.97, -38.51), "CE": ("Fortaleza", -3.73, -38.52),
    "DF": ("Brasília", -15.79, -47.88), "ES": ("Vitória", -20.32, -40.34), "GO": ("Goiânia", -16.68, -49.25),
    "MA": ("São Luís", -2.53, -44.30), "MT": ("Cuiabá", -15.60, -56.10), "MS": ("Campo Grande", -20.47, -54.62),
    "MG": ("Belo Horizonte", -19.92, -43.94), "PA": ("Belém", -1.46, -48.50), "PB": ("João Pessoa", -7.12, -34.86),
    "PR": ("Curitiba", -25.43, -49.27), "PE": ("Recife", -8.05, -34.88), "PI": ("Teresina", -5.09, -42.80),
    "RJ": ("Rio de Janeiro", -22.91, -43.17), "RN": ("Natal", -5.79, -35.21), "RS": ("Porto Alegre", -30.03, -51.23),
    "RO": ("Porto Velho", -8.76, -63.90), "RR": ("Boa Vista", 2.82, -60.67), "SC": ("Florianópolis", -27.59, -48.55),
    "SP": ("São Paulo", -23.55, -46.63), "SE": ("Aracaju", -10.91, -37.07), "TO": ("Palmas", -10.18, -48.33),
}
# Estados liberados no lançamento (os outros ficam "em breve")
DISPONIVEIS = {"SP", "RJ", "DF"}
# Cidades do lançamento e a cidade especial do dono
CIDADES = [
    ("SaoPaulo", "São Paulo", -23.55, -46.63, True, False),
    ("RioDeJaneiro", "Rio de Janeiro", -22.91, -43.17, True, False),
    ("Brasilia", "Brasília", -15.79, -47.88, True, False),
    ("Campinas", "Campinas", -22.91, -47.06, False, True),   # especial, ainda sem data
]
PEQUENOS = {"DF", "SE", "AL", "RJ", "ES", "RN", "PB"}          # ganham peso extra na amostragem

dados = json.load(open(GEO, encoding="utf-8"))
estados = {}
for f in dados["features"]:
    p = f["properties"]
    estados[p["sigla"]] = {"nome": p["name"], "geom": f["geometry"]}
siglas = sorted(estados)
indice = {s: i + 1 for i, s in enumerate(siglas)}
CHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0"
char_de = {s: CHARS[i] for i, s in enumerate(siglas)}

def px(lon, lat):
    return ((lon - LON0) / PASSO * SS, (LAT0 - lat) / PASSO * SS)

img = Image.new("L", (COLS * SS, LINHAS * SS), 0)
d = ImageDraw.Draw(img)
ordem = [s for s in siglas if s != "DF"] + ["DF"]  # DF por cima de GO
for s in ordem:
    geom = estados[s]["geom"]
    polys = geom["coordinates"] if geom["type"] == "MultiPolygon" else [geom["coordinates"]]
    for poly in polys:
        d.polygon([px(lon, lat) for lon, lat in poly[0]], fill=indice[s])  # só o contorno externo

grade = [[None] * COLS for _ in range(LINHAS)]
for r in range(LINHAS):
    for c in range(COLS):
        h = img.crop((c * SS, r * SS, (c + 1) * SS, (r + 1) * SS)).histogram()
        terra = sum(h[1:])
        if terra < 0.4 * SS * SS:
            continue
        melhor, valor = None, -1
        for s in siglas:
            v = h[indice[s]] * (2 if s in PEQUENOS else 1)
            if v > valor:
                melhor, valor = s, v
        grade[r][c] = melhor

def celula_de(lat, lon):
    return int((LAT0 - lat) / PASSO), int((lon - LON0) / PASSO)

# garante pelo menos uma célula por estado e a célula de Brasília como DF
for s in siglas:
    if not any(s in linha for linha in grade):
        r, c = celula_de(CAPITAL[s][1], CAPITAL[s][2])
        grade[r][c] = s
r, c = celula_de(CAPITAL["DF"][1], CAPITAL["DF"][2]); grade[r][c] = "DF"
for _, _, lat, lon, _, _ in CIDADES[:2]:
    r, c = celula_de(lat, lon)
    if grade[r][c] is None:
        grade[r][c] = "SP" if lon < -45 else "RJ"

# ---------- arquivo para o Roblox ----------
linhas_lua = ["".join(char_de[x] if x else "." for x in linha) for linha in grade]
L = []
L.append("-- GERADO por gerar_mapa_brasil.py (não edite a 'grade').")
L.append("-- Para liberar um estado: troque disponivel = false por true (ou use o atributo Liberado_UF no Workspace).")
L.append("-- Contorno dos estados: dados abertos do IBGE.")
L.append("return {")
L.append(f"\tpasso = {PASSO}, lon0 = {LON0}, lat0 = {LAT0}, colunas = {COLS}, linhas = {LINHAS}, celula = {CELULA},")
L.append("\tgrade = {")
for ln in linhas_lua:
    L.append(f'\t\t"{ln}",')
L.append("\t},")
L.append("\testados = {")
for s in siglas:
    nome = estados[s]["nome"]
    cap = CAPITAL[s]
    L.append(f'\t\t{s} = {{ nome = "{nome}", regiao = "{REGIAO[s]}", capital = "{cap[0]}", c = "{char_de[s]}", disponivel = {"true" if s in DISPONIVEIS else "false"} }},')
L.append("\t},")
L.append("\tcidades = {")
for chave, nome, lat, lon, disp, esp in CIDADES:
    L.append(f'\t\t{chave} = {{ nome = "{nome}", lat = {lat}, lon = {lon}, disponivel = {"true" if disp else "false"}, especial = {"true" if esp else "false"} }},')
L.append("\t},")
L.append("}")
open(f"{SAIDA}/MapaBrasil_Dados.lua", "w", encoding="utf-8").write("\n".join(L) + "\n")

# ---------- imagem de prévia ----------
COR = {"Norte": (46, 125, 70), "Nordeste": (214, 178, 96), "Centro-Oeste": (196, 138, 70),
       "Sudeste": (94, 170, 84), "Sul": (70, 150, 130)}
Z = 9
W, H = COLS * Z + 330, LINHAS * Z + 20
pre = Image.new("RGB", (W, H), (26, 22, 38))
pd = ImageDraw.Draw(pre)
pd.rectangle([8, 8, COLS * Z + 12, LINHAS * Z + 12], fill=(38, 52, 96))
try:
    fonte = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf", 12)
    fonte2 = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf", 15)
except Exception:
    fonte = fonte2 = ImageFont.load_default()
for r in range(LINHAS):
    for c in range(COLS):
        s = grade[r][c]
        if not s:
            continue
        cor = COR[REGIAO[s]]
        if s not in DISPONIVEIS:
            cor = tuple(int(v * 0.5 + g * 0.5) for v, g in zip(cor, (74, 68, 98)))
        x, y = 10 + c * Z, 10 + r * Z
        pd.rectangle([x, y, x + Z - 1, y + Z - 1], fill=cor)
        for dr, dc, lado in ((0, 1, "d"), (1, 0, "b")):
            rr, cc = r + dr, c + dc
            viz = grade[rr][cc] if rr < LINHAS and cc < COLS else None
            if viz != s:
                if lado == "d": pd.line([x + Z - 1, y, x + Z - 1, y + Z - 1], fill=(15, 12, 24))
                else: pd.line([x, y + Z - 1, x + Z - 1, y + Z - 1], fill=(15, 12, 24))
for s in siglas:
    cel = [(r, c) for r in range(LINHAS) for c in range(COLS) if grade[r][c] == s]
    cx = sum(c for r, c in cel) / len(cel); cy = sum(r for r, c in cel) / len(cel)
    cor_t = (255, 235, 160) if s in DISPONIVEIS else (200, 195, 215)
    pd.text((10 + cx * Z + Z / 2 - 8, 10 + cy * Z + Z / 2 - 7), s, fill=cor_t, font=fonte)
for chave, nome, lat, lon, disp, esp in CIDADES:
    x, y = 10 + (lon - LON0) / PASSO * Z, 10 + (LAT0 - lat) / PASSO * Z
    pd.ellipse([x - 4, y - 4, x + 4, y + 4], fill=(255, 215, 90) if disp else (255, 140, 200), outline=(15, 12, 24))
lx = COLS * Z + 30
pd.text((lx, 20), "BRASIL EM BLOCOS", fill=(247, 195, 92), font=fonte2)
pd.text((lx, 44), f"{COLS} x {LINHAS} células · 1 célula = {CELULA} studs", fill=(242, 233, 220), font=fonte)
pd.text((lx, 62), f"≈ {COLS*CELULA:,} x {LINHAS*CELULA:,} studs".replace(",", "."), fill=(242, 233, 220), font=fonte)
pd.text((lx, 96), "LIBERADOS NO LANÇAMENTO", fill=(255, 235, 160), font=fonte)
for i, s in enumerate(sorted(DISPONIVEIS)):
    pd.text((lx, 116 + i * 18), f"• {s}  {estados[s]['nome']}", fill=(242, 233, 220), font=fonte)
pd.text((lx, 190), "EM BREVE (bloqueados)", fill=(200, 195, 215), font=fonte)
pd.text((lx, 210), f"• os outros {len(siglas) - len(DISPONIVEIS)} estados", fill=(242, 233, 220), font=fonte)
pd.text((lx, 244), "CIDADES", fill=(255, 235, 160), font=fonte)
for i, (chave, nome, lat, lon, disp, esp) in enumerate(CIDADES):
    cor = (255, 215, 90) if disp else (255, 140, 200)
    pd.ellipse([lx, 266 + i * 20, lx + 9, 275 + i * 20], fill=cor, outline=(15, 12, 24))
    pd.text((lx + 16, 264 + i * 20), nome + ("  (especial)" if esp else ""), fill=(242, 233, 220), font=fonte)
pre.save(f"{SAIDA}/mapa_brasil_preview.png")
print("ok", COLS, LINHAS, sum(1 for l in grade for x in l if x), "células de terra")
for s in siglas:
    n = sum(1 for l in grade for x in l if x == s)
    print(s, n, end=" | ")
print()
