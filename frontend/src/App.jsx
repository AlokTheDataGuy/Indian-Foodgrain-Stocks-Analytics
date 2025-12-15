import React, { useState } from 'react';
import { FileText, Code, Database, BarChart3, Download, View, ExternalLink, ChevronDown, ChevronUp, Github, Linkedin, Mail } from 'lucide-react';
import slide1 from '../../screenshots/overview.png';
import slide2 from '../../screenshots/commodity.png';
import slide3 from '../../screenshots/state.png';
import slide4 from '../../screenshots/anomalies.png';
import slide5 from '../../screenshots/forecast.png';


export default function FoodgrainDashboard() {
  const [activeTab, setActiveTab] = useState('dashboard');
  const [showMethodology, setShowMethodology] = useState(false);
  const [currentSlide, setCurrentSlide] = useState(0);
  const [showWarning, setShowWarning] = useState(false);


  // Replace these with your actual links
  const links = {
    powerbi: 'https://app.powerbi.com/reportEmbed?reportId=3d83cb04-7a0e-467f-835d-592f1fdf7396&autoAuth=true&ctid=56c1d497-700b-49cf-8f8d-3dd6b20d522f&navContentPaneEnabled=false&filterPaneEnabled=false',
    report: 'https://drive.google.com/file/d/1u0ZBS5nQxcECOvM5_2ygXis6L0R4eeF6/view?usp=sharing',
    notebook: 'https://drive.google.com/drive/folders/16PIuugM8tDYp4rFYppV0g_fTB-deBikG?usp=sharing',
    data: 'https://drive.google.com/drive/folders/1UHsvuj50QebVc3VSkmE4GmUBG3Mgzq0k?usp=sharing',
    github: 'https://github.com/AlokTheDataGuy/Indian-Foodgrain-Stocks-Analytics',
    ogd: 'https://www.data.gov.in/resource/daily-fci-stock-position-commodity'
  };

  const techStack = [
    { name: 'Python', icon: '🐍', color: 'bg-blue-100 text-blue-700' },
    { name: 'SQL', icon: '💾', color: 'bg-green-100 text-green-700' },
    { name: 'Power BI', icon: '📊', color: 'bg-yellow-100 text-yellow-700' },
    { name: 'Prophet', icon: '🔮', color: 'bg-purple-100 text-purple-700' },
    { name: 'Pandas', icon: '🐼', color: 'bg-pink-100 text-pink-700' },
    { name: 'DAX', icon: '📈', color: 'bg-orange-100 text-orange-700' }
  ];

  const features = [
    {
      icon: <BarChart3 className="w-6 h-6" />,
      title: 'Executive Overview',
      desc: 'High-level KPIs and national trends'
    },
    {
      icon: <BarChart3 className="w-6 h-6" />,
      title: 'Commodity Analysis',
      desc: 'Deep dive with moving averages'
    },
    {
      icon: <BarChart3 className="w-6 h-6" />,
      title: 'Geographic Insights',
      desc: 'State & district level drilldown'
    },
    {
      icon: <BarChart3 className="w-6 h-6" />,
      title: 'Anomaly Detection',
      desc: 'Alert system with Z-scores'
    },
    {
      icon: <BarChart3 className="w-6 h-6" />,
      title: 'Forecast Dashboard',
      desc: 'Predictions with confidence intervals'
    }
  ];

  const stats = [
    { label: 'Data Points', value: '2.2M+' },
    { label: 'Time Period', value: '2011-2025' },
    { label: 'States Covered', value: '26' },
    { label: 'Commodities', value: '4' }
  ];

  const slides = [
    {
      img: slide1,
      title: 'Foodgrain Overview',
      desc: 'National KPIs and high-level stock trends'
    },
    {
      img: slide2,
      title: 'Commodity Deep Dive',
      desc: 'Commodity-wise trends with moving averages'
    },
    {
      img: slide3,
      title: 'State-Level Drilldown',
      desc: 'State and district-level stock distribution'
    },
    {
      img: slide4,
      title: 'Anomaly Monitoring',
      desc: 'Z-score based anomaly detection'
    },
    {
      img: slide5,
      title: 'Stock Forecast & Predictions',
      desc: '30D & 90D forecasts with confidence intervals'
    }
  ];


  return (
    <div className="min-h-screen bg-gradient-to-br from-green-50 via-white to-green-50">
      {/* Header */}
      <header className="bg-white shadow-sm border-b border-green-100">
        <div className="max-w-7xl mx-auto px-4 py-6 sm:px-6 lg:px-8">
          <div className="flex items-center justify-between">
            <div className="flex items-center space-x-3">
              <div className="bg-green-600 p-2 rounded-lg">
                <BarChart3 className="w-8 h-8 text-white" />
              </div>
              <div>
                <h1 className="text-3xl font-bold text-gray-900">
                  Foodgrain Stocks Analysis
                </h1>
                <p className="text-sm text-gray-600 mt-1">
                  Comprehensive Analytics Dashboard | India OGD Portal Data
                </p>
              </div>
            </div>
            <div className="flex space-x-3">
              <a href={links.github} target="_blank" rel="noopener noreferrer"
                className="p-2 hover:bg-gray-100 rounded-full transition">
                <Github className="w-5 h-5 text-gray-600" />
              </a>
            </div>
          </div>
        </div>
      </header>

      {/* Stats Bar */}
      <div className="bg-green-600 text-white">
        <div className="max-w-7xl mx-auto px-4 py-4 sm:px-6 lg:px-8">
          <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
            {stats.map((stat, idx) => (
              <div key={idx} className="text-center">
                <div className="text-2xl font-bold">{stat.value}</div>
                <div className="text-sm text-green-100">{stat.label}</div>
              </div>
            ))}
          </div>
        </div>
      </div>

      {/* Main Content */}
      <div className="max-w-7xl mx-auto px-4 py-8 sm:px-6 lg:px-8">

        {/* Navigation Tabs */}
        <div className="bg-white rounded-lg shadow-md mb-6 overflow-hidden">
          <div className="flex border-b border-gray-200">
            <button
              onClick={() => setActiveTab('dashboard')}
              className={`flex-1 px-6 py-4 text-sm font-medium transition ${activeTab === 'dashboard'
                ? 'bg-green-600 text-white'
                : 'text-gray-600 hover:bg-gray-50'
                }`}>
              <BarChart3 className="w-5 h-5 inline mr-2" />
              Dashboard
            </button>
            <button
              onClick={() => setActiveTab('resources')}
              className={`flex-1 px-6 py-4 text-sm font-medium transition ${activeTab === 'resources'
                ? 'bg-green-600 text-white'
                : 'text-gray-600 hover:bg-gray-50'
                }`}>
              <FileText className="w-5 h-5 inline mr-2" />
              Resources
            </button>
            <button
              onClick={() => setActiveTab('about')}
              className={`flex-1 px-6 py-4 text-sm font-medium transition ${activeTab === 'about'
                ? 'bg-green-600 text-white'
                : 'text-gray-600 hover:bg-gray-50'
                }`}>
              <Code className="w-5 h-5 inline mr-2" />
              About Project
            </button>
          </div>
        </div>

        {/* Dashboard Tab */}
        {activeTab === 'dashboard' && (
          <div className="space-y-6">
            <div className="bg-white rounded-lg shadow-lg overflow-hidden">
              <div className="bg-gradient-to-r from-green-600 to-green-700 px-6 py-4">
                <h2 className="text-xl font-bold text-white">
                  {slides[currentSlide].title}
                </h2>
                <p className="text-green-100 text-sm mt-1">
                  Snapshot of {slides[currentSlide].desc}
                </p>

              </div>

              {/* Screenshot Carousel */}
              <div className="p-4 bg-gray-50">
                <div className="bg-white rounded-lg shadow-inner border border-gray-200 relative">

                  <img
                    src={slides[currentSlide].img}
                    alt={`Dashboard slide ${currentSlide + 1}`}
                    className="w-full rounded-lg"
                  />

                  {/* Controls */}
                  <button
                    onClick={() =>
                      setCurrentSlide((prev) => (prev === 0 ? slides.length - 1 : prev - 1))
                    }
                    className="absolute left-3 top-1/2 -translate-y-1/2 bg-white/80 p-2 rounded-full shadow hover:bg-white"
                  >
                    ‹
                  </button>

                  <button
                    onClick={() =>
                      setCurrentSlide((prev) => (prev === slides.length - 1 ? 0 : prev + 1))
                    }
                    className="absolute right-3 top-1/2 -translate-y-1/2 bg-white/80 p-2 rounded-full shadow hover:bg-white"
                  >
                    ›
                  </button>

                  {/* Dots */}
                  <div className="flex justify-center gap-2 py-3">
                    {slides.map((_, idx) => (
                      <button
                        key={idx}
                        onClick={() => setCurrentSlide(idx)}
                        className={`w-2.5 h-2.5 rounded-full ${idx === currentSlide ? 'bg-green-600' : 'bg-gray-300'
                          }`}
                      />
                    ))}
                  </div>
                </div>
              </div>


              {/* Quick Links Below Dashboard */}
              <div className="px-6 py-4 bg-gray-50 border-t border-gray-200">
                <div className="flex flex-wrap gap-3">
                  <button
                    onClick={() => setShowWarning(true)}
                    className="inline-flex items-center px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700 transition text-sm font-medium"
                  >
                    <ExternalLink className="w-4 h-4 mr-2" />
                    View Interactive Dashboard
                  </button>

                  <a href={links.report} target="_blank" rel="noopener noreferrer"
                    className="inline-flex items-center px-4 py-2 bg-white border border-gray-300 text-gray-700 rounded-lg hover:bg-gray-50 transition text-sm font-medium">
                    <FileText className="w-4 h-4 mr-2" />
                    View Report
                  </a>
                </div>
              </div>
            </div>

            {/* Features Grid */}
            <div className="grid md:grid-cols-3 gap-4">
              {features.map((feature, idx) => (
                <div key={idx} className="bg-white p-6 rounded-lg shadow-md hover:shadow-lg transition">
                  <div className="bg-green-100 w-12 h-12 rounded-lg flex items-center justify-center text-green-600 mb-4">
                    {feature.icon}
                  </div>
                  <h3 className="font-semibold text-gray-900 mb-2">{feature.title}</h3>
                  <p className="text-sm text-gray-600">{feature.desc}</p>
                </div>
              ))}
            </div>
          </div>
        )}

        {/* Resources Tab */}
        {activeTab === 'resources' && (
          <div className="space-y-4">
            <div className="bg-white rounded-lg shadow-md overflow-hidden">
              <div className="p-6">
                <h2 className="text-2xl font-bold text-gray-900 mb-6">Project Resources</h2>

                <div className="space-y-4">
                  {/* Report Link */}
                  <a href={links.report} target="_blank" rel="noopener noreferrer"
                    className="flex items-start p-4 border-2 border-gray-200 rounded-lg hover:border-green-500 hover:bg-green-50 transition group">
                    <div className="bg-red-100 p-3 rounded-lg group-hover:bg-red-200 transition">
                      <FileText className="w-6 h-6 text-red-600" />
                    </div>
                    <div className="ml-4 flex-1">
                      <div className="flex items-center justify-between">
                        <h3 className="font-semibold text-gray-900">📄 Project Report (PDF)</h3>
                        <ExternalLink className="w-4 h-4 text-gray-400 group-hover:text-green-600" />
                      </div>
                      <p className="text-sm text-gray-600 mt-1">
                        Complete documentation including methodology, analysis, and insights
                      </p>
                      <span className="text-xs text-gray-400 mt-2 inline-block">Google Drive</span>
                    </div>
                  </a>

                  {/* Notebook Link */}
                  <a href={links.notebook} target="_blank" rel="noopener noreferrer"
                    className="flex items-start p-4 border-2 border-gray-200 rounded-lg hover:border-green-500 hover:bg-green-50 transition group">
                    <div className="bg-orange-100 p-3 rounded-lg group-hover:bg-orange-200 transition">
                      <Code className="w-6 h-6 text-orange-600" />
                    </div>
                    <div className="ml-4 flex-1">
                      <div className="flex items-center justify-between">
                        <h3 className="font-semibold text-gray-900">💻 Python Notebook</h3>
                        <ExternalLink className="w-4 h-4 text-gray-400 group-hover:text-green-600" />
                      </div>
                      <p className="text-sm text-gray-600 mt-1">
                        Data cleaning, analysis, forecasting with Prophet, and anomaly detection
                      </p>
                      <span className="text-xs text-gray-400 mt-2 inline-block">Google Colab</span>
                    </div>
                  </a>

                  {/* Data Link */}
                  <a href={links.data} target="_blank" rel="noopener noreferrer"
                    className="flex items-start p-4 border-2 border-gray-200 rounded-lg hover:border-green-500 hover:bg-green-50 transition group">
                    <div className="bg-green-100 p-3 rounded-lg group-hover:bg-green-200 transition">
                      <Database className="w-6 h-6 text-green-600" />
                    </div>
                    <div className="ml-4 flex-1">
                      <div className="flex items-center justify-between">
                        <h3 className="font-semibold text-gray-900">📊 Raw Data</h3>
                        <ExternalLink className="w-4 h-4 text-gray-400 group-hover:text-green-600" />
                      </div>
                      <p className="text-sm text-gray-600 mt-1">
                        Original dataset from India's Open Government Data Portal
                      </p>
                      <span className="text-xs text-gray-400 mt-2 inline-block">Google Sheets</span>
                    </div>
                  </a>

                  {/* GitHub Link */}
                  <a href={links.github} target="_blank" rel="noopener noreferrer"
                    className="flex items-start p-4 border-2 border-gray-200 rounded-lg hover:border-green-500 hover:bg-green-50 transition group">
                    <div className="bg-gray-800 p-3 rounded-lg group-hover:bg-gray-900 transition">
                      <Github className="w-6 h-6 text-white" />
                    </div>
                    <div className="ml-4 flex-1">
                      <div className="flex items-center justify-between">
                        <h3 className="font-semibold text-gray-900">🔗 GitHub Repository</h3>
                        <ExternalLink className="w-4 h-4 text-gray-400 group-hover:text-green-600" />
                      </div>
                      <p className="text-sm text-gray-600 mt-1">
                        Complete source code, SQL queries, and Power BI file
                      </p>
                      <span className="text-xs text-gray-400 mt-2 inline-block">GitHub</span>
                    </div>
                  </a>
                </div>
              </div>
            </div>
          </div>
        )}

        {/* About Tab */}
        {activeTab === 'about' && (
          <div className="space-y-6">
            {/* Project Overview */}
            <div className="bg-white rounded-lg shadow-md p-6">
              <h2 className="text-2xl font-bold text-gray-900 mb-4">Project Overview</h2>
              <p className="text-gray-700 leading-relaxed mb-4">
                A comprehensive end-to-end data analytics project analyzing India's foodgrain stocks across
                26 states and 177 districts from 2010-2025. The project includes data collection from <a href={links.ogd} target="_blank" rel="noopener noreferrer"> India's
                  Open Government Data Portal</a>, extensive cleaning and processing using Python and SQL, time series
                forecasting with Prophet, anomaly detection using Z-scores, and interactive visualization
                through a 5-page Power BI dashboard.
              </p>

              <div className="bg-green-50 border-l-4 border-green-600 p-4 mt-4">
                <p className="text-sm text-green-800">
                  <strong>Key Achievement:</strong> Processed and analyzed over <strong>2.2M+</strong> foodgrain
                  stock records, built a fully reproducible pipeline for national–state–district aggregation, 30D and 90D forecasting, and detected <strong>4,992 anomalies </strong>
                  across commodities.
                </p>
              </div>
            </div>

            {/* Tech Stack */}
            <div className="bg-white rounded-lg shadow-md p-6">
              <h2 className="text-2xl font-bold text-gray-900 mb-4">Technology Stack</h2>
              <div className="grid grid-cols-2 md:grid-cols-3 gap-3">
                {techStack.map((tech, idx) => (
                  <div key={idx} className={`${tech.color} px-4 py-3 rounded-lg text-center font-medium`}>
                    <span className="text-2xl mr-2">{tech.icon}</span>
                    {tech.name}
                  </div>
                ))}
              </div>
            </div>

            {/* Methodology */}
            <div className="bg-white rounded-lg shadow-md overflow-hidden">
              <button
                onClick={() => setShowMethodology(!showMethodology)}
                className="w-full px-6 py-4 flex items-center justify-between hover:bg-gray-50 transition">
                <h2 className="text-2xl font-bold text-gray-900">Methodology</h2>
                {showMethodology ? (
                  <ChevronUp className="w-5 h-5 text-gray-600" />
                ) : (
                  <ChevronDown className="w-5 h-5 text-gray-600" />
                )}
              </button>

              {showMethodology && (
                <div className="px-6 pb-6 space-y-4">
                  <div className="border-l-4 border-blue-500 pl-4">
                    <h3 className="font-semibold text-gray-900 mb-2">1. Data Collection</h3>
                    <p className="text-sm text-gray-600">
                      Collected 2.2M+ records from  <a href={links.ogd} target="_blank" rel="noopener noreferrer">India's OGD Portal</a> covering 4 commodities (Paddy, Wheat,
                      Rice-Raw, Rice-Parboiled) across 26 states and 177 districts.
                    </p>
                  </div>

                  <div className="border-l-4 border-green-500 pl-4">
                    <h3 className="font-semibold text-gray-900 mb-2">2. Data Processing</h3>
                    <p className="text-sm text-gray-600">
                      Cleaned and transformed data using Python (Pandas) and SQL. Created aggregated tables
                      at national, state, and district levels. Handled missing values and outliers.
                    </p>
                  </div>

                  <div className="border-l-4 border-purple-500 pl-4">
                    <h3 className="font-semibold text-gray-900 mb-2">3. Time Series Forecasting</h3>
                    <p className="text-sm text-gray-600">
                      Implemented Facebook Prophet for forecasting future stock levels with 30-day and 90-day
                      predictions. Generated confidence intervals for uncertainty quantification.
                    </p>
                  </div>

                  <div className="border-l-4 border-red-500 pl-4">
                    <h3 className="font-semibold text-gray-900 mb-2">4. Anomaly Detection</h3>
                    <p className="text-sm text-gray-600">
                      Applied Z-score based statistical method to identify anomalies.
                    </p>
                  </div>

                  <div className="border-l-4 border-orange-500 pl-4">
                    <h3 className="font-semibold text-gray-900 mb-2">5. Visualization & Insights</h3>
                    <p className="text-sm text-gray-600">
                      Created 5-page interactive Power BI dashboard with 30+ DAX measures, conditional
                      formatting, drill-through capabilities, and mobile-responsive design.
                    </p>
                  </div>
                </div>
              )}
            </div>

            {/* Key Insights */}
            <div className="bg-white rounded-lg shadow-md p-6">
              <h2 className="text-2xl font-bold text-gray-900 mb-4">Key Insights</h2>
              <ul className="space-y-3">
                <li className="flex items-start">
                  <span className="text-green-600 mr-3 text-xl">✓</span>
                  <span className="text-gray-700">
                    <strong>Punjab leads</strong> in central stock contribution with ~503.13B current stock,
                    followed by Haryana and Uttar Pradesh.                  </span>
                </li>
                <li className="flex items-start">
                  <span className="text-green-600 mr-3 text-xl">✓</span>
                  <span className="text-gray-700">
                    <strong>Rice-Raw dominates</strong> composition at 47%, followed by Wheat at 43%.
                  </span>
                </li>
                <li className="flex items-start">
                  <span className="text-green-600 mr-3 text-xl">✓</span>
                  <span className="text-gray-700">
                    <strong>Seasonal patterns</strong> show peaks around Jun–Jul and Nov–Dec
                    (procurement / harvest cycles).
                  </span>
                </li>
                <li className="flex items-start">
                  <span className="text-green-600 mr-3 text-xl">✓</span>
                  <span className="text-gray-700">
                    <strong>Forecast accuracy</strong> of 85%+ achieved for 30-day forecasts
                    on recent validation windows.
                  </span>
                </li>
                <li className="flex items-start">
                  <span className="text-green-600 mr-3 text-xl">✓</span>
                  <span className="text-gray-700">
                    <strong>4,992 anomalies detected</strong> with highest concentration in Jharkhand and Punjab.
                  </span>
                </li>
              </ul>
            </div>
          </div>
        )}
      </div>

      {showWarning && (
        <div className="fixed inset-0 bg-black/70 flex items-center justify-center z-50">
    <div className="bg-white rounded-lg shadow-xl max-w-md w-full p-6">
      <h3 className="text-lg font-bold text-gray-900 mb-2">
        Power BI Sign-In Required
      </h3>
      <p className="text-sm text-gray-600 mb-4">
        This dashboard is hosted on Power BI. A Microsoft Power BI account is
        required to access the interactive version.
      </p>

      <div className="flex justify-end gap-3">
        <button
          onClick={() => setShowWarning(false)}
          className="px-4 py-2 text-sm border rounded-lg hover:bg-gray-100"
        >
          Cancel
        </button>
        <a
          href={links.powerbi}
          target="_blank"
          rel="noopener noreferrer"
          className="px-4 py-2 text-sm bg-green-600 text-white rounded-lg hover:bg-green-700"
        >
          Continue
        </a>
      </div>
    </div>
  </div>
)}


      {/* Footer */}
      <footer className="bg-gray-900 text-white mt-16">
        <div className="max-w-7xl mx-auto px-4 py-8 sm:px-6 lg:px-8">
          <div className="text-center">
            <p className="text-gray-400 text-sm">
              © 2025 Foodgrain Stocks Analysis Project. Built with 🤯 by <a href="https://alok-the-data-guy.vercel.app/">@AlokTheDataGuy</a>.
            </p>
          </div>
        </div>
      </footer>
    </div>
  );
}