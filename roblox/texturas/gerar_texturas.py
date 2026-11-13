# Gera texturas pixel art 32x32 que se repetem sem emenda, ampliadas 8x (256x256) SEM suavizar.
import random, sys
from PIL import Image, ImageDraw
OUT = sys.argv[1]
N = 32
def mix(a, b, t): return tuple(int(a[i] + (b[i]-a[i])*t) for i in range(3))
def varia(c, r, f=14): return tuple(max(0, min(255, v + r.randint(-f, f))) for v in c)

def salvar(img, nome):
    img.resize((N*8, N*8), Image.NEAREST).save(f"{OUT}/{nome}.png")
    return img.resize((N*8, N*8), Image.NEAREST)

def tijolo(nome, base, argamassa, seed):
    r = random.Random(seed); img = Image.new("RGB", (N, N)); p = img.load()
    for y in range(N):
        linha = y // 8
        for x in range(N):
            xx = (x + (8 if linha % 2 else 0)) % N
            borda = (y % 8 == 7) or (xx % 16 == 15)
            if borda: p[x, y] = varia(argamassa, r, 6)
            else:
                tom = r.random()
                p[x, y] = varia(mix(base, (base[0]+22, base[1]+14, base[2]+10), tom), r, 8)
                if y % 8 == 0: p[x, y] = tuple(min(255, v+22) for v in p[x, y])  # luz em cima
                if y % 8 == 6: p[x, y] = tuple(max(0, v-26) for v in p[x, y])    # sombra embaixo
    return salvar(img, nome)

def paralelepipedo(nome, base, rejunte, seed):
    r = random.Random(seed); img = Image.new("RGB", (N, N)); p = img.load()
    for y in range(N):
        for x in range(N):
            xx = (x + (4 if (y // 4) % 2 else 0)) % N
            if y % 4 == 3 or xx % 8 == 7: p[x, y] = varia(rejunte, r, 5)
            else:
                p[x, y] = varia(base, r, 10)
                if y % 4 == 0: p[x, y] = tuple(min(255, v+14) for v in p[x, y])
    return salvar(img, nome)

def calcada(nome, base, rejunte, seed):
    r = random.Random(seed); img = Image.new("RGB", (N, N)); p = img.load()
    for y in range(N):
        for x in range(N):
            if x % 16 == 15 or y % 16 == 15: p[x, y] = varia(rejunte, r, 5)
            else:
                p[x, y] = varia(base, r, 9)
                if x % 16 == 0 or y % 16 == 0: p[x, y] = tuple(min(255, v+16) for v in p[x, y])
    return salvar(img, nome)

def asfalto(nome, base, seed):
    r = random.Random(seed); img = Image.new("RGB", (N, N)); p = img.load()
    for y in range(N):
        for x in range(N):
            p[x, y] = varia(base, r, 12)
            if r.random() < 0.06: p[x, y] = tuple(min(255, v+34) for v in p[x, y])
            if r.random() < 0.05: p[x, y] = tuple(max(0, v-30) for v in p[x, y])
    return salvar(img, nome)

def parede(nome, base, seed):
    r = random.Random(seed); img = Image.new("RGB", (N, N)); p = img.load()
    for y in range(N):
        for x in range(N):
            p[x, y] = varia(base, r, 6)
            if r.random() < 0.03: p[x, y] = tuple(max(0, v-26) for v in p[x, y])
    # manchas de umidade que se repetem sem emenda
    for _ in range(6):
        cx, cy = r.randrange(N), r.randrange(N)
        for dy in range(-2, 3):
            for dx in range(-2, 3):
                if r.random() < 0.55:
                    q = ((cx+dx) % N, (cy+dy) % N)
                    p[q] = tuple(max(0, v-18) for v in p[q])
    return salvar(img, nome)

def telhado(nome, base, seed):
    r = random.Random(seed); img = Image.new("RGB", (N, N)); p = img.load()
    for y in range(N):
        for x in range(N):
            xx = (x + (4 if (y // 4) % 2 else 0)) % N
            curva = (xx % 8)
            c = varia(base, r, 6)
            if y % 4 == 0: c = tuple(min(255, v+26) for v in c)
            if y % 4 == 3: c = tuple(max(0, v-34) for v in c)
            if curva == 7: c = tuple(max(0, v-20) for v in c)
            p[x, y] = c
    return salvar(img, nome)

def grama(nome, base, seed):
    r = random.Random(seed); img = Image.new("RGB", (N, N)); p = img.load()
    for y in range(N):
        for x in range(N):
            p[x, y] = varia(base, r, 9)
    for _ in range(70):
        x, y = r.randrange(N), r.randrange(N)
        claro = tuple(min(255, v+30) for v in base)
        p[x, y] = claro; p[x, (y+1) % N] = claro
    for _ in range(40):
        x, y = r.randrange(N), r.randrange(N)
        p[x, y] = tuple(max(0, v-30) for v in base)
    return salvar(img, nome)

def madeira(nome, base, seed):
    r = random.Random(seed); img = Image.new("RGB", (N, N)); p = img.load()
    for x in range(N):
        veio = r.randint(-12, 12)
        for y in range(N):
            c = varia(tuple(max(0, min(255, v+veio)) for v in base), r, 5)
            if x % 8 == 7: c = tuple(max(0, v-34) for v in c)
            p[x, y] = c
    return salvar(img, nome)

def janela(nome, acesa, seed):
    r = random.Random(seed); img = Image.new("RGB", (N, N), (40, 34, 58)); p = img.load()
    for y in range(4, 28):
        for x in range(6, 26):
            t = (y-4)/24
            p[x, y] = mix(acesa, (255, 214, 120), 1-t) if r.random() > 0.05 else tuple(min(255, v+20) for v in acesa)
    for y in range(4, 28):
        p[15, y] = (40, 34, 58); p[16, y] = (40, 34, 58)
    for x in range(6, 26): p[x, 15] = (40, 34, 58)
    for x in range(4, 28):
        p[x, 28] = (120, 100, 130); p[x, 29] = (90, 74, 104)
    return salvar(img, nome)

pecas = [
    tijolo("tijolo_vermelho", (150, 78, 82), (86, 60, 74), 1),
    tijolo("tijolo_roxo", (112, 84, 128), (66, 52, 86), 2),
    paralelepipedo("paralelepipedo_rua", (86, 78, 104), (44, 38, 60), 3),
    calcada("calcada", (172, 120, 104), (96, 68, 72), 4),
    asfalto("asfalto", (62, 58, 78), 5),
    parede("reboco_claro", (226, 210, 196), 6),
    telhado("telha_ceramica", (186, 92, 62), 7),
    grama("grama", (82, 158, 84), 8),
    madeira("madeira", (150, 102, 58), 9),
    janela("janela_acesa", (247, 176, 80), 10),
]
# folha de visualização: cada textura repetida 2x2 (para ver se emenda)
folha = Image.new("RGB", (5*(N*8*2)//2 + 60, 2*(N*8*2)//2 + 30), (26, 22, 38))
for i, im in enumerate(pecas):
    mosaico = Image.new("RGB", (N*8*2, N*8*2))
    for a in range(2):
        for b in range(2): mosaico.paste(im, (a*N*8, b*N*8))
    mosaico = mosaico.resize((N*8, N*8), Image.NEAREST)
    folha.paste(mosaico, (10 + (i % 5)*(N*8+10), 10 + (i // 5)*(N*8+10)))
folha.save(f"{OUT}/_amostra.png")
print("ok", len(pecas))
