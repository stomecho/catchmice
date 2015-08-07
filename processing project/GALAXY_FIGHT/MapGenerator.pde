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
     if(j==0)sd=1;
     if(i==0)sd=1;
     if(j==mh-1)sd=1;
     if(i==mw-1)sd=1;
     map[j][i]=sd;
  }
}

