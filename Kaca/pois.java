package Kaca;
import java.util.ArrayList;
import java.util.List;



public class pois {
	
	 public static void main(String[] args)
	 {
	  boolean[][] maze = new boolean[10][10];
	  ustvariNakljucniLabirint(maze);
	  narisiLabirint(maze);
	  List< Celica > path = findLongestPath(maze);
	  if (path == null)
	  {
	   System.out.println("No path possible");
	   return;
	  }
	  for (Celica cell : path)
	   System.out.print(cell + ",");
	  System.out.println();
	 }

	 private static List< Celica > findLongestPath(boolean[][] maze)
	 {
	  Celica start = new Celica(0, 0);
	  Celica end = new Celica(maze.length - 1, maze[0].length - 1);
	  List< Celica > path = findLongestPath(maze, start, end);
	  return path;
	 }

	 private static List< Celica > findLongestPath(boolean[][] maze, Celica start,
	   Celica end)
	 {
	  List< Celica > result = null;
	  int rows = maze.length;
	  int cols = maze[0].length;
	  if (start.vr < 0 || start.st < 0)
	   return null;
	  if (start.vr == rows || start.st == cols)
	   return null;
	  if (maze[start.vr][start.st] == true)
	   return null;
	  if (start.equals(end))
	  {
	   List< Celica > path = new ArrayList< Celica >();
	   path.add(start);
	   return path;
	  }
	  maze[start.vr][start.st] = true;
	  Celica[] nextCells = new Celica[4];
	  nextCells[0] = new Celica(start.vr + 1, start.st);
	  nextCells[2] = new Celica(start.vr, start.st + 1);
	  nextCells[1] = new Celica(start.vr - 1, start.st);
	  nextCells[3] = new Celica(start.vr, start.st - 1);
	  int maxLength = -1;
	  for (Celica nextCell : nextCells)
	  {
	   List< Celica > path = findLongestPath(maze, nextCell, end);
	   if (path != null && path.size() > maxLength)
	   {
	    maxLength = path.size();
	    path.add(0, start);
	    result = path;
	   }
	  }
	  maze[start.vr][start.st] = false;
	  if (result == null || result.size() == 0)
	   return null;
	  return result;
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
