class squareOscillator extends oscillatorBase{
  squareOscillator(float _frequency,float _phase){
    super(_frequency,_phase);
  }
  
  float getValue(){
    phase++;
    if(sin(((this.frequency*PI)/22050)*this.phase) >= 0){
      return 1;
    }
    else{
      return -1;
    }
  }
}
