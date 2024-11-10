package Kaca;
import java.util.ArrayList;
import java.util.List;


public class Nekej {




	
	 public static void main(String[] args)
	 {
	  boolean[][] labirint = new boolean[10][10];
	  ustvariNakljucniLabirint(labirint);
	  narisiLabirint(labirint);
	  int[][] mat = vsePoti(labirint);
	  if (mat == null)
	  {
	   System.out.println("Ne obstaja pot");
	   return;
	  }
	  for (Celica celica : mat)
	   System.out.print(celica + ",");
	  System.out.println();
	 }

	 private static int[][] vsePoti(boolean[][] labirint)
	 {
	  Celica zacetek = new Celica(0, 0);
	  Celica konec = new Celica(labirint.length - 1, labirint[0].length - 1);
	  int[][] mat = vsePotI(labirint, zacetek, konec);
	  return mat;
	 }

	 private static int[][] vsePoti(boolean[][] labirint, Celica zacetek,
	   Celica konec)
	 {
	  List< Celica > rezultat = null;
	  int stVrstic = labirint.length;
	  int stStolpcev = labirint[0].length;
	  if (zacetek.vr < 0 || zacetek.st < 0)
	   return null;
	  if (zacetek.vr == stVrstic || zacetek.st == stStolpcev)
	   return null;
	  if (labirint[zacetek.vr][zacetek.st] == true)
	   return null;
	  if (zacetek.equals(konec))
	  {
	   List< Celica > pot = new ArrayList< Celica >();
	   pot.add(zacetek);
	   return pot;
	  }
	  labirint[zacetek.vr][zacetek.st] = true;
	  Celica[] naslednjaCelice = new Celica[4];
	  naslednjaCelice[0] = new Celica(zacetek.vr + 1, zacetek.st);
	  naslednjaCelice[2] = new Celica(zacetek.vr, zacetek.st + 1);
	  naslednjaCelice[1] = new Celica(zacetek.vr - 1, zacetek.st);
	  naslednjaCelice[3] = new Celica(zacetek.vr, zacetek.st - 1);
	  int maxDolzina = -1;
	  for (Celica naslednjaCelica  : naslednjaCelice)
	  {
	   List< Celica > pot = najdaljsaPot(labirint, naslednjaCelica, konec);
	   if (pot != null && pot.size() > maxDolzina)
	   {
	    maxDolzina = pot.size();
	    pot.add(0, zacetek);
	    rezultat = pot;
	   }
	  }
	  labirint[zacetek.vr][zacetek.st] = false;
	  if (rezultat == null || rezultat.size() == 0)
	   return null;
	  return rezultat;
	 }

	 private static class Celica
	 {
	  public int vr;
	  public int st;

	  public Celica(int vr, int st)
	  {
	   this.vr = vr;
	   this.st = st;
	  }

	  @Override
	  public boolean equals(Object obj)
	  {
	   if (this == obj)
	    return true;
	   if ((obj == null) || (obj.getClass() != this.getClass()))
	    return false;
	   Celica celica = (Celica) obj;
	   if (vr == celica.vr && st == celica.st)
	    return true;
	   return false;
	  }

	  @Override
	  public String toString()
	  {
	   return "(" + vr + "," + st + ")";
	  }
	 }

	 private static void narisiLabirint(boolean[][] labirint)
	 {
	  for (int i = 0; i < labirint.length; ++i)
	  {
	   for (int j = 0; j < labirint[i].length; ++j)
	   {
	    if (labirint[i][j])
	     System.out.print("0 ");
	    else
	     System.out.print("1 ");
	   }
	   System.out.println();
	  }
	 }

	 private static void ustvariNakljucniLabirint(boolean[][] labirint)
	 {
	  for (int i = 0; i < labirint.length; ++i)
	  {
	   for (int j = 0; j < labirint[0].length; ++j)
	   {
	    labirint[i][j] = (int) (Math.random() * 3) == 1; //pri 3 je velikokrat brez poti toda pri 4 pa predolgo traja
	   }
	  }
	  labirint[0][0] = false;
	  labirint[labirint.length - 1][labirint[0].length - 1] = false;

	 }

}


}
