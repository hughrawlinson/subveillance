class envelope{
  float value;
  float attackLength;
  float decayLength;
  float sustainLevel;
  float releaseLength;
  int phase;
  int stage;
  boolean triggered;
  boolean released;
  float releasedTime;
  float currentLevel;
  envelope(){
    this.stage = 5;
    this.phase = 1;
    this.attackLength = 0;
    this.decayLength = 0;
    this.sustainLevel = 1;
    this.releaseLength = 0;
  }
  
  void set(float _attackLength,float _decayLength,float _sustainLevel,float _releaseLength){
    this.attackLength = _attackLength*(44100/1000);
    this.decayLength = _decayLength*(44100/1000);
    this.sustainLevel = _sustainLevel;
    this.releaseLength = _releaseLength*(44100/1000);
  }
  void setAttack(float _attackLength){
    this.attackLength = _attackLength;
  }
  void setDecay(float _decayLength){
    this.decayLength = _decayLength;
  }
  void setSustain(float _sustainLevel){
    this.sustainLevel = _sustainLevel;
  }
  void setRelease(float _releaseLength){
    this.releaseLength = _releaseLength;
  }
  
  void trigger(){
    this.triggered = true;
    phase=1;
    stage=1;
  }
  
  void release(){
    this.stage = 4;
    this.released = true;
    this.releasedTime = this.phase;
  }
  
  float getValue(){
    phase++;
    if(this.stage == 1){
      if(this.phase >= this.attackLength){
        stage++;
      }
      this.currentLevel = this.phase/this.attackLength;
    }
    else if(this.stage == 2){
      if(this.phase >= this.attackLength + this.decayLength){
        stage++;
      }
      this.currentLevel = 1 - ((this.phase-this.attackLength)/this.decayLength)*(1-this.sustainLevel);
    }
    else if(this.stage == 3){
      this.currentLevel = this.sustainLevel;
    }
    else if(this.stage == 4){
      if(this.phase >= this.releasedTime + this.releaseLength){
        this.stage++;
      }
      this.currentLevel = this.currentLevel - ((this.phase-this.releasedTime)/this.releaseLength)*this.currentLevel;
    }
    else{
      phase = 0;
      this.currentLevel = 0;
    }
    if(this.currentLevel >= 0 && this.currentLevel <= 1){
      return this.currentLevel;
    }
    else{
      return 0;
    }
  }
}
