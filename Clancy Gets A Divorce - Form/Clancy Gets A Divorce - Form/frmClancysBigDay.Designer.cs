namespace Clancy_Gets_A_Divorce___Form
{
    partial class frmClancysBigDay
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmClancysBigDay));
            this.lblBig = new System.Windows.Forms.Label();
            this.imgClancy = new System.Windows.Forms.PictureBox();
            ((System.ComponentModel.ISupportInitialize)(this.imgClancy)).BeginInit();
            this.SuspendLayout();
            // 
            // lblBig
            // 
            this.lblBig.AutoSize = true;
            this.lblBig.BackColor = System.Drawing.Color.Transparent;
            this.lblBig.Font = new System.Drawing.Font("Microsoft Sans Serif", 27.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblBig.Location = new System.Drawing.Point(12, 64);
            this.lblBig.Name = "lblBig";
            this.lblBig.Size = new System.Drawing.Size(360, 42);
            this.lblBig.TabIndex = 0;
            this.lblBig.Text = "Clancy\'s Big Divorce";
            // 
            // imgClancy
            // 
            this.imgClancy.Image = global::Clancy_Gets_A_Divorce___Form.Properties.Resources.clancybat;
            this.imgClancy.Location = new System.Drawing.Point(279, 166);
            this.imgClancy.Name = "imgClancy";
            this.imgClancy.Size = new System.Drawing.Size(16, 32);
            this.imgClancy.TabIndex = 1;
            this.imgClancy.TabStop = false;
            // 
            // frmClancysBigDay
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.ClientSize = new System.Drawing.Size(624, 442);
            this.Controls.Add(this.imgClancy);
            this.Controls.Add(this.lblBig);
            this.Name = "frmClancysBigDay";
            this.Text = "Clancy\'s Big Day";
            ((System.ComponentModel.ISupportInitialize)(this.imgClancy)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblBig;
        private System.Windows.Forms.PictureBox imgClancy;
    }
}