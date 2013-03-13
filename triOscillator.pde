class triOscillator extends oscillatorBase{
  boolean direction;
  float valueIMinus1;
  triOscillator(float _frequency,float _phase){
    super(_frequency,_phase);
    valueIMinus1 = 0;
    direction = true;
  }
  
  float getValue(){
    phase++;
    float increment = 2/(1/(this.frequency/44100));
    float actual_increment;
    
    if (direction){
      actual_increment = increment;
    }
    else {
      actual_increment = -1 * increment;
    }
    
    if ((((1+valueIMinus1) + 2*increment))-1 > 1 || (((1+valueIMinus1) + 2*increment))-1 < -1){
      direction = !direction;
    }
    float sample;
    if(direction){
      sample = (((1+valueIMinus1) + 2*increment))-1;
    }
    else{
      sample = (((1+valueIMinus1) - 2*increment))-1;
    }
    valueIMinus1 = sample;
    return sample;
  }
}
