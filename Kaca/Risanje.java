package Kaca;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

// https://github.com/lovre/pro2/blob/master/labs/j2/Circles.java

public class Risanje extends JFrame {
	
	private static final long serialVersionUID = 1L;
	
	private List<Lik> risba;
	
	public Risanje() {
		super();
		
		risba = new ArrayList<Lik>();
		
		setTitle("Risanje");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		getRootPane().putClientProperty("apple.awt.brushMetalLook", true);
		setPreferredSize(new Dimension(900, 650));
		setMinimumSize(new Dimension(600, 450));
		setLayout(new BorderLayout());
		
		JPanel console = new JPanel();
		add(console, BorderLayout.NORTH);
		
		JButton nov = new JButton("Dodaj");
		nov.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				risba.add(new Lik(Math.random(), Math.random(), 25));
				repaint();
			}
		});
		console.add(nov);
		
		JButton pocisti = new JButton("Poèisti");
		pocisti.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				risba.clear();
				repaint();
			}
		});
		console.add(pocisti);
		
				
		JPanel panel = new JPanel() {
			private static final long serialVersionUID = 1L;
			@Override
			public void paint(Graphics xy) {
				super.paint(xy);
				for (Lik krog: risba) {
					xy.setColor(new Color((int)(Math.random() * 0x1000000)));
					
					xy.drawOval((int)Math.round(krog.getX() * getWidth()) - krog.getRadius(), (int)Math.round(krog.getY() * getHeight()) - krog.getRadius(), 2 * krog.getRadius(), 2 * krog.getRadius());
				}
			}
		};
		
		panel.setBackground(Color.WHITE);
		add(panel, BorderLayout.CENTER);
	}

	public static void main(String[] args) {
		new Risanje().setVisible(true);
	}

}

class Lik {
	
	private double x;
	
	private double y;
	
	private int radius;

	public Lik(double x, double y, int radius) {
		super();
		this.x = x;
		this.y = y;
		this.radius = radius;
	}

	public double getX() {
		return x;
	}

	public double getY() {
		return y;
	}

	public int getRadius() {
		return radius;
	}	
}