class lowPassFilter{
  int sampleRate;
  float filterFrequency;
  float filterResonance;
  float c;
  float a1;
  float a2;
  float a3;
  float b1;
  float b2;
  float drive;
  ArrayList preFilter;
  ArrayList postFilter;
  
  lowPassFilter( int _sampleRate){
    this.sampleRate = _sampleRate;
    this.filterFrequency = sampleRate/2;
    this.filterResonance = 1;
    this.preFilter = new ArrayList();
    this.postFilter = new ArrayList();
    this.drive = 0;
    for(int i = 0; i < 3; i++){
      this.preFilter.add(0.);
      this.postFilter.add(0.);
    }
  }
  
  void setFrequency(float _frequency){
    this.filterFrequency = _frequency;
  }
  
  void setResonance(float _resonance){
    this.filterResonance = _resonance;
  }
  
  void setDrive(float _drive){
    this.drive = _drive;
  }  
  
  float getValue(float sample){
    float a = sin(((this.drive+1)/101)*(PI/2)) ;
    float k = 2*a/(1-a);
    this.c = 1.0 / tan(PI * this.filterFrequency / this.sampleRate);
    this.a1 = 1.0 / ( 1.0 + this.filterResonance * this.c + this.c * this.c);
    this.a2 = 2* this.a1;
    this.a3 = this.a1;
    this.b1 = 2.0 * ( 1.0 - this.c*this.c) * this.a1;
    this.b2 = ( 1.0 - this.filterResonance * this.c + this.c * this.c) * this.a1;
    
    this.preFilter.add(sample);
    this.preFilter.remove(0);
    
    sample = this.a1 * (Float)preFilter.get(2) +
             this.a2 * (Float)preFilter.get(1) +
             this.a3 * (Float)preFilter.get(0) -
             this.b1 * (Float)postFilter.get(2) -
             this.b2 * (Float)postFilter.get(1);
    
    this.postFilter.add(sample);
    this.postFilter.remove(0);
    return sample*0.09999;
  }
}
