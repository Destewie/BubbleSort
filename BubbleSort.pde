int DIM = 50; //dimensione del vettore //<>//
int[] vett = new int [DIM];
float wRect;
boolean scambio = true;
int index = 0;
int posizioneGiaOrdinata = DIM; //index non serve che vada oltre a questo indice perchè sappiamo che dopo è gia tutto ordinato

void setup() 
{
  size(550, 360);
  vett = InizializzaVettore(vett);  //mette dei numeri randomici all'interno che poi verranno ordinati
  wRect = width/DIM;

  frameRate(80);
}

//---------------------------------------------------------------------------------------------

void draw() 
{

  if (posizioneGiaOrdinata > 1)
  {
    if (vett[index] > vett[index+1]) 
    {
      int n = vett[index];
      vett[index] = vett[index+1];
      vett[index+1] = n;
      scambio = true; //Lo setto a true per indicare che é avvenuto uno scambio
    }

    //disegna i rettangoli
    background(173, 216, 230);
    for (int i=0; i<DIM; i++)
    {
      if (i == index+1) // perchè il fatto è che avremo sempre ad index+1 il numero maggiore fino ad ora
      {
        fill(0, 255, 0);
      } else
      {
        fill(255, 255, 255);
      }

      float hRect =  CalcolaAltezza(vett[i]);
      rect((i*wRect), height-hRect, wRect, hRect);
    }

    index++;
    if (index+1 == posizioneGiaOrdinata)
    {
      if (scambio == true)
      {
        index = 0;
        posizioneGiaOrdinata --;
        scambio = false;
      } else  //L'ultima stampa prima che si arresti. Serve a visualizzare tutti i rettangoli bianchi
      {
        background(173, 216, 230);
        for (int i=0; i<DIM; i++)
        {
          fill(255, 255, 255);
          float hRect =  CalcolaAltezza(vett[i]);
          rect((i*wRect), height-hRect, wRect, hRect);
        }
        print("Non serve continuare perche' non sono più avvenuti scambi ed e' gia' tutto ordinato.");
        noLoop();
      }
    }
  } else //Si arresta perchè è arrivato al numero massimo di controlli e quindi è giunto al termine
  {
    background(173, 216, 230);
    for (int i=0; i<DIM; i++)
    {
      fill(255, 255, 255);
      float hRect =  CalcolaAltezza(vett[i]);
      rect((i*wRect), height-hRect, wRect, hRect);
    }
    print("Basta, sarai anche stanco... Ti ho fatto vedere tutti gli scambi possibili.");
    noLoop();
  }
}


//---------------------------------------------------------------------------------------------

int[] InizializzaVettore(int[] v)
{ 
  for (int i=0; i<DIM; i++)
  {
    v[i] = (int)random(DIM); //vanno da 0 a 49
    //print(v[i], " " );
  }

  return v;
}

//---------------------------------------------------------------------------------------------

float CalcolaAltezza(int n)
{
  return ((height * n)/DIM);
}

//---------------------------------------------------------------------------------------------
