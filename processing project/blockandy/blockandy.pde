//基本:
//製作一個方形區域 (約50X50就好)
//滑鼠左鍵按壓從內往外拖曳時綠色
//滑鼠左鍵按壓從外往內拖曳時紅色
//並且按壓重複從內外拖曳不會變色
//以從沒按壓到按壓時的第一個動作決定顏色
//直到滑鼠左鍵放開後重置為白色
//
//中階:
//滑鼠右鍵按壓在其上時變為藍色
//按壓不放拖曳出方型區域時會自我複製一個相同方形區域跟隨游標移動
//並在右鍵放開時此新增的方形區塊會被放置在游標位置(此功能有點像檔案複製)
//
//進階:
//同樣使用右鍵拖曳放開後若放置在其他方形區域內會使得兩方形區域皆自我清除
ArrayList<bk> block = new ArrayList();
void setup(){
  size(1000,1000);
  strokeWeight(5);
  block.add(new bk(110,100));
  block.add(new bk(250,100));
}

void draw(){
  background(255);
  for(int i=0;i<block.size();i++){
    block.get(i).update(block);
  }
  for(int i=0;i<block.size();i++){
    block.get(i).draw();
  }
  System.gc();
    Runtime rt = Runtime.getRuntime();
    long usedMB = (rt.totalMemory() - rt.freeMemory()) / 1024 / 1024;
//    logger.information(this, "memory usage" + usedMB);
    fill(0);
    text(usedMB,500,500);
}


