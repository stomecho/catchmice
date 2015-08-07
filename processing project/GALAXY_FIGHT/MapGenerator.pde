void MapSetup(int mw,int mh){
  int sd=0;
  for(int i=0;i<mh;i++)
    for(int j=0;j<mw;j++){
     if(i<mh/3){
       sd=int(random(0,1.1));
       if(sd==1)sd=int(random(0,1.1));
     }
     else if(i>mh/3&&i<mh/3+3){
       sd=int(random(0.9,1.9));
       if(sd==0)sd=int(random(0.8,1.2));
     }
     else if(i>mh/3+3)
       sd=int(random(0,1.7));
     map[j][i]=sd;
  }
}

