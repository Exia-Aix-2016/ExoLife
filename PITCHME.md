# ExoLife: Rapport des missions

![ESA](assets/img_colorlogo_negative.png)

---

# Objectif

Rechercher de la vie ailleur dans l'univers grâce au traitement d'images

---

## Sommaire

- Missions A: traitement d'image local
- Missions B: transformation linéaire et seuillage
- Missions U: traitement par convolution et détection de contour
- Missions X: transformation de Fourrier et filtre median

---

## Mission A-1: Encelade

Identifier une zone ou atterir.

![Encelade](missions/A1/img/Encelade.jpg)

+++

## Image originale

![Original](missions/A1/img/original.png)

+++

## Resultat

On cherche le pixel qui a la valeur la plus élevée.

Valeur du pixel: 216

Coordonnées: x=22;y=38

---

## Mission A-2: Mars

Déterminer la quantité de certains gaz (méthane par exemple) dans l’atmosphère martienne (indice de vie potentielle).

![Mars](missions/A2/img/Mars.jpg)

+++

## Image originale

![Original](missions/A2/img/original.png)

+++

## Resultat

On fait une moyenne de la valeur des pixels et on la convertie en pourcentage.

Taux de gaz: 54.93 %

---

## Mission A-3: Europe

Cartographier la circulation de l'eau sous la surface glacée de l'astre en ne faisant apparaître que les canaux d'eau "chaude".

![Europe](missions/A3/img/Europe.jpg)

+++

## Image originale

![Original](missions/A3/img/original.png)

+++

## Etape 1

On applique un seuillage pour garder uniquement les pixels blancs.

![Step1](missions/A3/img/step1.png)

+++

## Resultat

On applique un filtre passe bas.

![Result](missions/A3/img/result.png)

---

## Mission A-4: Jupiter

Obtenir une image de la planète de meilleure qualité.


![Jupiter](missions/A4/img/jupiter.jpg)

+++

## Image originale 1

![Jupiter](missions/A4/img/original1.png) 

+++

## Image originale 2

![Jupiter](missions/A4/img/original2.png)

+++

## Soustration d'image
```
// Definir une image bruit
img3 = soustraction(img2, img1);
imwrite(to_native_img(img3), "img/step1.png");

// Soustraire le bruit
img4 = soustraction(img1, img3);
imwrite(to_native_img(img4), "img/step2.png");

// Appliquer un filtre median
result = median(img4, 25);
imwrite(to_native_img(result), "img/result.png");
```
@[2-3]
@[6-7]
@[10-11]

+++

## Resultat

![Jupiter](missions/A4/img/result.png)
---
## Mission B-1: Gliese 667Cc

Travailler l'image reçue afin de faire apparaître l'atmosphère de la planète.

![Gliese 667Cc](missions/B1/img/Gliese_667Cc.jpg)

+++

## Image originale

![Original](missions/B1/img/original.png)

+++

## Transformation linéaire

```
getd ('../../libs/');
source = readpbm('Gliese 667Cc_surface.pbm');

// Transformation linéaire
result = 255 / (max(source) - min(source)) * (source - min(source));

// Export to png
imwrite(to_native_img(result), "img/result.png");
```

@[1-2]
@[5]
@[8]

+++

## Resultat

On fait une transformation linéaire.

![Result](missions/B1/img/result.png)

---

## Mission B-2: GD 61

Améliorer la visibilité de l'image pour la donner ensuite à un autre service qui identifiera la position de GD 61.

+++

## Image originale

![Original](missions/B2/img/original.png)

+++

## Resultat

On fait une transformation linéaire.

![Result](missions/B2/img/result.png)

---

## Mission B-3: HD 215497 b

Séparer en 4 parties distinctes les zones présentes sur la photo afin de distinguer les zones plus ou moins chaudes (terre, volcans, eau, etc.).

![HD 215497 b](missions/B3/img/HD215497.jpg)

+++

## Image originale

![Original](missions/B3/img/original.png)

+++

## Etape 1: Génerer l'histogramme

```
img = readpbm('HD215497.pbm');
xmax = size(img,1);
ymax = size(img,2);
hist = zeros(1,256);

for x=1:xmax
    for y=1:ymax
        hist(double(img(x,y))+1)=hist(double(img(x,y))+1)+1;
    end
end
```

@[1-4]
@[6-10]

+++

## Etape 1: Génerer l'histogramme

![Histogramme](missions/B3/img/histogramme.png)

+++

## Etape 2: Effectuer 4 seuillages

```
function [render]=seuillage(img,seuil)
    xmax = size(img,1)
    ymax = size(img,2)
    colorMin = 0
    for x=1:xmax
        for y=1:ymax
            if (img(x,y) < seuil) then
                img(x,y) = colorMin;
            else
                img(x,y) = seuil;
            end
        end
    end
    render = img;
endfunction
```

@[1]
@[2-4]
@[5-13]

+++

## Resultat: 10

![Seuillage10](missions/B3/img/seuillage10.png)

+++

## Resultat: 16

![Seuillage16](missions/B3/img/seuillage16.png)

+++

## Resultat: 31

![Seuillage31](missions/B3/img/seuillage31.png)

+++

## Resultat: 255

![Seuillage255](missions/B3/img/seuillage255.png)

---

## Mission U-1: Planete inconnue

Une image a été interceptée par une sonde. L'analyse à faire doit permettre de faire apparaître ce qui ressemble à un "réseau routier".

![?](missions/U1/img/Coruscante.jpg)

+++

## Image originale

![Original](missions/U1/img/original.png)

+++

## Etape 1: Filtre passe haut

```
filtre_passe_haut = [
    0 -2 0
    -2 9 -2
    0 -2 0
];

imgF = imfilter(img, filtre_passe_haut);
```

+++

## Resultat

![Result](missions/U1/img/result.png)

---

## Mission U-2: Inconnu

Une planète semble se trouver à un endroit de l'univers où une faille temporelle a été détectée (un trou noir était à l'origine supposé). Un corps étranger semble perturber les analyses, il faut donc l'isoler sur l'image, car cela pourrait signifier la présence d'une technologie avancée.

![?](missions/U2/img/Gallifrey.jpg)

+++

## Image originale

![Original](missions/U2/img/original.png)

+++

## Resultat

On applique une détéction de contours de type sobel.

![Result](missions/U2/img/result.png)

---

## Mission X-1: Asellus Secundus

Transformer l'étrange image reçue par la sonde. Celle-ci ne répond plus aux communications depuis que l'image a été envoyée.

+++

## Image originale

![Original](missions/X1/img/AsellusSecundus.jpg)

+++

## Resultat

On fait une transformation inverse de Fourrier.

![Result](missions/X1/img/result.png)

---

## Mission X-2: Gliese 581d

Vérifier que ce qui apparaît sur l'image est bien de la végétation.

+++

## Image originale

![Original 2](missions/X2/img/original2.png)

+++

## Resultat

On applique un filtre median.

![Result](missions/X2/img/result_v2.png)

---

## Conclusion

- Traitement d'image 👍️
- Faire un mini framework ?
- Scilab 🎲
- Scilab documentation 👎