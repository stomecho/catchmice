void MapSetup(int mw,int mh){
  int sd=0;
  for(int i=0;i<mh;i++)
    for(int j=0;j<mw+1;j++){
     if(i<mh/3){
       sd=int(random(0,1.5));
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
     if(i==mh-1)sd=1;
     if(j==mw)sd=1;
     if(j==mw-1)sd=1;
     if(i>mh/3&&i<mh/4){
       sd=int(random(2));
       if(sd==0)sd=int(random(0.6,1.5));
     }
     map[j][i]=sd;
  }
}

