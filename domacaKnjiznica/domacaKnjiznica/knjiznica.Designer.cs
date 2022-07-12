
namespace domacaKnjiznica
{
    partial class knjiznica
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(knjiznica));
            this.dodajanjeStran = new System.Windows.Forms.Button();
            this.iskanjeStran = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // dodajanjeStran
            // 
            this.dodajanjeStran.Font = new System.Drawing.Font("Microsoft Sans Serif", 55.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dodajanjeStran.Location = new System.Drawing.Point(0, 13);
            this.dodajanjeStran.Name = "dodajanjeStran";
            this.dodajanjeStran.Size = new System.Drawing.Size(550, 143);
            this.dodajanjeStran.TabIndex = 0;
            this.dodajanjeStran.Text = "Dodajanje";
            this.dodajanjeStran.UseVisualStyleBackColor = true;
            this.dodajanjeStran.Click += new System.EventHandler(this.dodajanjeStran_Click);
            // 
            // iskanjeStran
            // 
            this.iskanjeStran.Font = new System.Drawing.Font("Microsoft Sans Serif", 55.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.iskanjeStran.Location = new System.Drawing.Point(550, 13);
            this.iskanjeStran.Name = "iskanjeStran";
            this.iskanjeStran.Size = new System.Drawing.Size(550, 143);
            this.iskanjeStran.TabIndex = 1;
            this.iskanjeStran.Text = "Iskanje";
            this.iskanjeStran.UseVisualStyleBackColor = true;
            this.iskanjeStran.Click += new System.EventHandler(this.iskanjeStran_Click);
            // 
            // knjiznica
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1082, 453);
            this.Controls.Add(this.iskanjeStran);
            this.Controls.Add(this.dodajanjeStran);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximumSize = new System.Drawing.Size(1100, 500);
            this.MinimumSize = new System.Drawing.Size(1100, 500);
            this.Name = "knjiznica";
            this.Text = "Domača knjižnica";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button dodajanjeStran;
        private System.Windows.Forms.Button iskanjeStran;
    }
}

