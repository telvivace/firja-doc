Kaj je zaznava trkov?

Zaznava trkov je pomembna na več različnih področjih:
- Programska oprema za računalniško podprt razvoj (orodja CAD)
- Robotika
- Fizikalne simulacije
- Videoigre

Problemi:
- Iskanje trkov je samo po sebi kvadratno kompleksno.
- Zato je večina postopkov pospeševanja zaznave trkov samo filtriranje parov objektov, ki se ne morejo zaleteti.
- Samo filtriranje je odvisno od pristopa, a ponavadi poskuša zagotoviti, da se časovno potratno izvajanje zaznave trkov zgodi na čim manjšem številu objektov.
- Za filtriranje so velikokrat potrebne podatkovne strukture, ki sistem, v katerem iščemo trke, razdelijo na prostorske regije, kar omogoči hitro zmanjševanje števila objektov, ki jih moramo obravnavati.


Navajeni smo, da učinkovitost merimo samo z asimptotičnimi vrednostmi (1000 * n² je enako kompleksno kot 10 * n²), saj v svetu algoritmov in dokazovanja kompleksnosti ni smiselnega načina, s katerim bi lahko določili te konstantne vrednosti.
A kljub temu so te konstantne vrednosti zelo pomembne za aplikacije algoritmov v resničnem svetu, saj lahko (pri nizkem številu objektov) kljub svoji logaritemski kompleksnosti iskalni algoritem s konstantnim faktorjem 850 močno zaostaja za hitrim, a kvadratno kompleksnim algoritmom za zaznavo trkov s konstantnim faktorjem 16. Zato je pazljivo eksperimentiranje in določanje mejnih vrednosti ključnega pomena za dobro delovanje programov za zaznavo trkov.

Primeri podatkovnih struktur:
- Hierarhija omejujočih volumnov (R* tree)
- Quadtree - drevo, ki rekurzivno razdeljuje 2D prostor na 4 dele
- Octree - verzija drevesa quadtree, ki počne enako s 3D prostorom (in ga razdeli na 8 delov)
- k-dimenzionalno drevo - drevo, ki rekurzivno razdeljuje prostor po izmenjujočih se dimenzijah
- BSP drevo - Dvojiško drevo, ki obravnava >1D prostor.

Vse te podatkovne strukture organizirajo določena telesa, objekte. Ti objekti so lahko definirani na veliko različnih načinov. Ponavadi se ne organizira direktno objektov, ampak njihove omejujoče volumne. Ključna lastnost omejujočega volumna je:
Če trčita objekta, vedno trčita tudi njuna omejujoča volumna.
Na podlagi te lastnosti lahko zaključimo, da se začetni del zaznave trkov lahko izvaja samo z omejujočimi volumni in bomo s tem zaznali tudi vse trke objektov.
Ko imamo seznam trkov omejujočih volumnov, lahko začnemo s časovno bolj potratnim zaznavanjem trkov med dejanskimi objekti.


RAZNO:
posebej štopam n² in log(n) in potem sestavim v skupen graf, najdem najnižjo točko in pogledam nastavitev.

