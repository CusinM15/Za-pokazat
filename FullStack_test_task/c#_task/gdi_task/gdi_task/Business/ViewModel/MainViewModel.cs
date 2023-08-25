using gdi_task.Business.Infractructure;
using System;
using System.IO;
using System.Net;
using System.Windows.Input;
using System.IO.Compression;
using System.Collections.Generic;
using System.Linq;
using gdi_task.Business.Model;
using gdi_task.Business.Services;
using System.Collections.ObjectModel;

namespace gdi_task.Business.VievModel
{
    public class MainViewModel : ViewModelBase
    {
        public ICommand Fill { get; set; }
        public ICommand Clean { get; set; }
        private string url = @"http://datoteke.durs.gov.si/DURS_zavezanci_PO.zip";
        private string downloadPath = "downloaded_file.zip";
        private string extractPath = "extracted_folder";
        private Service service;
        private ObservableCollection<SeznamDavcnihZavezancev> _seznamZavezancev;
        public ObservableCollection<SeznamDavcnihZavezancev> seznamZavezancev
        {
            get { return _seznamZavezancev; }
            set
            {
                _seznamZavezancev = value;
                OnPropertyChanged(nameof(seznamZavezancev));
            }
        }

        public MainViewModel()
        {
            Fill = new DelegateCommand(GetData);
            Clean = new DelegateCommand(ClearTable);
            service = new Service();
            seznamZavezancev = new ObservableCollection<SeznamDavcnihZavezancev>();
            if (Directory.Exists(extractPath))
            {
                ReadFileAndFillProperty();
            }
        }

        public void ClearTable(object obj)
        {
            if (Directory.Exists(extractPath))
            {
                // firstly delete zip file and the extract one
                try
                {
                    Directory.Delete(downloadPath, true);
                }
                catch (Exception ex)
                {
                }
                try
                {
                    Directory.Delete(extractPath, true);
                }
                catch (Exception ex)
                {
                }
                service.ClearTable();
                seznamZavezancev = new ObservableCollection<SeznamDavcnihZavezancev>();
            }
        }

        public void ReadFileAndFillProperty()
        {
            try
            {
                string filePath = Path.GetFullPath(extractPath) + "\\DURS_zavezanci_PO.txt";
                string fileContents = File.ReadAllText(filePath);
                List<string> linesOfData = fileContents.Split('\n').ToList();
                foreach (string element in linesOfData)
                {
                    if (!string.IsNullOrEmpty(element))
                    {
                        seznamZavezancev.Add(new SeznamDavcnihZavezancev
                        {
                            Znak = element.Substring(0, 3).Trim(),
                            PrvoCeloStevilo = element.Substring(4, 9).Trim(),
                            DrugoCeloStevilo = element.Substring(13, 11).Trim(),
                            Datum = element.Substring(24, 10).Trim(),
                            RealnoStevilo = element.Substring(35, 6).Trim(),
                            Ime = element.Substring(42, 101).Trim(),
                            Naslov = element.Substring(143, 114).Trim(),
                            Oznaka = element.Substring(257, 2).Trim()
                        });
                    }
                }
                service.UpdateNameInVehicle(seznamZavezancev);
            }
            catch (IOException e)
            {
            }
        }

        public async void GetData(object obj)
        {
            if (!Directory.Exists(extractPath))
            {
                using (WebClient client = new WebClient())
                {
                    client.DownloadFile(url, downloadPath);
                }
                ZipFile.ExtractToDirectory(downloadPath, extractPath);
                File.Delete(downloadPath);
                ReadFileAndFillProperty();
            }
        }
    }
}