//Baseado no programa exemplo da biblioteca EmonLib
 
//Carrega as bibliotecas
#include "EmonLib.h"
#include <SPI.h>
#define ADC_COUNTS  (1<<10)
 
EnergyMonitor emon1;
 
int rede = 127, pino_sct = A1;
byte i = 0, j = 0;
float tempoAnt = 0, T = 0.5; //em ms
float I_[200], tempo[200], Ical = 0.75, Vref = 5;
double offsetI = ADC_COUNTS>>1;

void setup(){
  Serial.begin(9600);
}
 
void loop(){
  while(micros() <= 100000.0){
    tempo[i] = micros()/1000.0;
    if((tempo[i] - tempoAnt) >= T){
      double sampleI = analogRead(pino_sct);
      offsetI = (offsetI + (sampleI-offsetI)/ADC_COUNTS);
      double filteredI = sampleI - offsetI;
      I_[i] = filteredI*(Ical*Vref/ADC_COUNTS);
      tempoAnt = tempo[i];
      tempo[i] = tempo[i]-T;
      i++;  
    }
  }
  while(j < (sizeof(tempo)/sizeof(tempo[0]))){
    Serial.print(I_[j]);
    Serial.print(", ");
    Serial.print(tempo[j]);
    Serial.println(";");
    j++;
  }
}
