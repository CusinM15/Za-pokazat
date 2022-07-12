
namespace ZacetnoOkno
{
    partial class glavnoOkno
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.kolikoBesedilo = new System.Windows.Forms.Label();
            this.gumbUstvariTabelo = new System.Windows.Forms.Button();
            this.kolikoBeri = new System.Windows.Forms.NumericUpDown();
            ((System.ComponentModel.ISupportInitialize)(this.kolikoBeri)).BeginInit();
            this.SuspendLayout();
            // 
            // kolikoBesedilo
            // 
            this.kolikoBesedilo.AutoSize = true;
            this.kolikoBesedilo.Location = new System.Drawing.Point(61, 36);
            this.kolikoBesedilo.Name = "kolikoBesedilo";
            this.kolikoBesedilo.Size = new System.Drawing.Size(424, 17);
            this.kolikoBesedilo.TabIndex = 0;
            this.kolikoBesedilo.Text = "Povejte število delavcev / procesorjev (minimum 2, maksimum 11):";
            // 
            // gumbUstvariTabelo
            // 
            this.gumbUstvariTabelo.Location = new System.Drawing.Point(205, 72);
            this.gumbUstvariTabelo.Name = "gumbUstvariTabelo";
            this.gumbUstvariTabelo.Size = new System.Drawing.Size(75, 23);
            this.gumbUstvariTabelo.TabIndex = 2;
            this.gumbUstvariTabelo.Text = "Ustvari";
            this.gumbUstvariTabelo.UseVisualStyleBackColor = true;
            this.gumbUstvariTabelo.Click += new System.EventHandler(this.gumbUstvariTabelo_Click);
            // 
            // kolikoBeri
            // 
            this.kolikoBeri.Location = new System.Drawing.Point(61, 72);
            this.kolikoBeri.Maximum = new decimal(new int[] {
            11,
            0,
            0,
            0});
            this.kolikoBeri.Minimum = new decimal(new int[] {
            2,
            0,
            0,
            0});
            this.kolikoBeri.Name = "kolikoBeri";
            this.kolikoBeri.Size = new System.Drawing.Size(120, 22);
            this.kolikoBeri.TabIndex = 3;
            this.kolikoBeri.Value = new decimal(new int[] {
            5,
            0,
            0,
            0});
            // 
            // glavnoOkno
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.kolikoBeri);
            this.Controls.Add(this.gumbUstvariTabelo);
            this.Controls.Add(this.kolikoBesedilo);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.Name = "glavnoOkno";
            this.Text = "Najcenejše popolno prirejanje";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            ((System.ComponentModel.ISupportInitialize)(this.kolikoBeri)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label kolikoBesedilo;
        private System.Windows.Forms.Button gumbUstvariTabelo;
        private System.Windows.Forms.NumericUpDown kolikoBeri;
    }
}

