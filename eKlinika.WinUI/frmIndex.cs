﻿using eKlinika.WinUI.Korisnici;
using eKlinika.WinUI.Pacijenti;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace eKlinika.WinUI
{
    public partial class frmIndex : Form
    {

        public frmIndex()
        {
            InitializeComponent();

            List<string> roles = APIService.Korisnik.KorisniciUloge.Select(x => x.Uloga.Naziv).ToList();
            bool IsAdmin = roles.Contains("Administrator");
            if (IsAdmin)
                tsmiKorisnici.Visible = true;

            if (IsAdmin || roles.Contains("Doktor"))
                tsmiDoktor.Visible = true;

            if (IsAdmin || roles.Contains("Apotekar"))
                tsmiApotekar.Visible = true;

            if (IsAdmin || roles.Contains("MedicinskaSestra"))
                tsmiMedicinskaSestra.Visible = true;

            if (IsAdmin || roles.Contains("Referent"))
                tsmiReferent.Visible = true;

            FormBorderStyle = FormBorderStyle.None;
        }

        private void OpenFile(object sender, EventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.Personal);
            openFileDialog.Filter = "Text Files (*.txt)|*.txt|All Files (*.*)|*.*";
            if (openFileDialog.ShowDialog(this) == DialogResult.OK)
            {
                string FileName = openFileDialog.FileName;
            }
        }

        private void SaveAsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            SaveFileDialog saveFileDialog = new SaveFileDialog();
            saveFileDialog.InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.Personal);
            saveFileDialog.Filter = "Text Files (*.txt)|*.txt|All Files (*.*)|*.*";
            if (saveFileDialog.ShowDialog(this) == DialogResult.OK)
            {
                string FileName = saveFileDialog.FileName;
            }
        }

        private void ExitToolsStripMenuItem_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void CascadeToolStripMenuItem_Click(object sender, EventArgs e)
        {
            LayoutMdi(MdiLayout.Cascade);
        }

        private void TileVerticalToolStripMenuItem_Click(object sender, EventArgs e)
        {
            LayoutMdi(MdiLayout.TileVertical);
        }

        private void TileHorizontalToolStripMenuItem_Click(object sender, EventArgs e)
        {
            LayoutMdi(MdiLayout.TileHorizontal);
        }

        private void ArrangeIconsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            LayoutMdi(MdiLayout.ArrangeIcons);
        }

        private void CloseAllToolStripMenuItem_Click(object sender, EventArgs e)
        {
            foreach (Form childForm in MdiChildren)
            {
                childForm.Close();
            }
        }

        private void pretragaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmKorisnici frm = new frmKorisnici();
            frm.Show();
        }

        private void noviKorisnikToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmKorisniciDetails frm = new frmKorisniciDetails();
            frm.Show();
        }

        private void noviPacijentToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmPacijentiDetails frm = new frmPacijentiDetails();
            frm.Show();

        }

        private void urediPacijentaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmPacijenti frm = new frmPacijenti();
            frm.Show();
        }

        private void minimizeForm_Click(object sender, System.EventArgs e)
        {
            WindowState = FormWindowState.Minimized;
        }

        private void maximizeForm_Click(object sender, System.EventArgs e)
        {
            WindowState = WindowState == FormWindowState.Maximized ? FormWindowState.Normal : FormWindowState.Maximized;
        }

        private void closeForm_Click(object sender, System.EventArgs e)
        {
            Close();
        }
    }
}
