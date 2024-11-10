package Kaca;


public class Stevilo {
	/*izračuna število možnih poti v matriki 
	 *pod pogojem, da gremo lahko le desno, dol, diagonalno  */
	public static int prestej(int[][] labirint)
	 {
		int n = labirint.length;
		int m = labirint[0].length;
		for (int i = 1; i < n; ++i)
		  {
		   for (int j = 1; j < m; ++j)
		   {
		    if (labirint[i][j] == 1)
		    	// pridemo lahko le na elemente z vrednostjo 1, 
		    	// na polje z vrednostjo 0 ne moremo, ker je to zid
		    	labirint[i][j] = labirint[i - 1][j] + labirint[i][j - 1] + labirint[i - 1][j - 1];
		   }
		  }
		int stevilo = labirint[n - 1][m - 1];
		return stevilo;
	 }
	public static void main (String[] args)  
    { 
        int labirint[][] = {{1, 1, 1, 0, 1, 0, 1, 1, 0, 1}, 
                       {1, 0, 1, 0, 1, 1, 0, 1, 1, 1}, 
                       {1, 1, 0, 1, 1, 1, 1, 1, 1, 1}, 
                       {1, 1, 1, 1, 0, 1, 1, 1, 1, 0},
                       {1, 1, 1, 0, 1, 1, 1, 0, 1, 0},
                       {1, 1, 1, 1, 0, 1, 1, 0, 0, 1},
                       {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
                       {1, 0, 1, 0, 1, 0, 1, 1, 1, 1},
                       {1, 1, 1, 0, 1, 1, 1, 0, 1, 1},
                       {1, 1, 1, 1, 1, 1, 1, 0, 1, 1}}; 
        System.out.println (prestej(labirint)); 
      
    } 

}


