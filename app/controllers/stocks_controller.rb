require 'httparty'
require 'json'

class StocksController < ApplicationController
  def index
  	@user = current_user
    @stocks = Stock.all
  end

  def show
    @stock = Stock.find(params[:id])
  end

  def secrete
  end

  def create_all 
    response1 = HTTParty.get('https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quotes%20where%20symbol%20in%20(%22MMM%22%2C%22ABT%22%2C%22ABBV%22%2C%22ACN%22%2C%22ATVI%22%2C%22AYI%22%2C%22ADBE%22%2C%22AAP%22%2C%22AES%22%2C%22AET%22%2C%22AFL%22%2C%22AMG%22%2C%22A%22%2C%22GAS%22%2C%22APD%22%2C%22AKAM%22%2C%22ALK%22%2C%22AA%22%2C%22AGN%22%2C%22ALXN%22%2C%22ALLE%22%2C%22ADS%22%2C%22ALL%22%2C%22GOOGL%22%2C%22GOOG%22%2C%22MO%22%2C%22AMZN%22%2C%22AEE%22%2C%22AAL%22%2C%22AEP%22%2C%22AXP%22%2C%22AIG%22%2C%22AMT%22%2C%22AWK%22%2C%22AMP%22%2C%22ABC%22%2C%22AME%22%2C%22AMGN%22%2C%22APH%22%2C%22APC%22%2C%22ADI%22%2C%22AON%22%2C%22APA%22%2C%22AIV%22%2C%22AAPL%22%2C%22AMAT%22%2C%22ADM%22%2C%22AJG%22%2C%22AIZ%22%2C%22T%22%2C%22ADSK%22%2C%22ADP%22%2C%22AN%22%2C%22AZO%22%2C%22AVGO%22%2C%22AVB%22%2C%22AVY%22%2C%22BHI%22%2C%22BLL%22%2C%22BAC%22%2C%22BK%22%2C%22BCR%22%2C%22BAX%22%2C%22BBT%22%2C%22BDX%22%2C%22BBBY%22%2C%22BRK%22%2C%22BBY%22%2C%22BIIB%22%2C%22BLK%22%2C%22HRB%22%2C%22BA%22%2C%22BWA%22%2C%22BXP%22%2C%22BSX%22%2C%22BMY%22%2C%22BF%22%2C%22CHRW%22%2C%22CA%22%2C%22COG%22%2C%22CPB%22%2C%22COF%22%2C%22CAH%22%2C%22HSIC%22%2C%22KMX%22%2C%22CCL%22%2C%22CAT%22%2C%22CBG%22%2C%22CBS%22%2C%22CELG%22%2C%22CNC%22%2C%22CNP%22%2C%22CTL%22%2C%22CERN%22%2C%22CF%22%2C%22SCHW%22%2C%22CHK%22%2C%22CVX%22%2C%22CMG%22%2C%22CB%22%2C%22CHD%22%2C%22CI%22%2C%22XEC%22%2C%22CINF%22%2C%22CTAS%22%2C%22CSCO%22%2C%22C%22%2C%22CTXS%22%2C%22CLX%22%2C%22CME%22%2C%22CMS%22%2C%22COH%22%2C%22KO%22%2C%22CTSH%22%2C%22CL%22%2C%22CPGX%22%2C%22CMCSA%22%2C%22CMA%22%2C%22CAG%22%2C%22CXO%22%2C%22COP%22%2C%22ED%22%2C%22STZ%22%2C%22GLW%22%2C%22COST%22%2C%22CCI%22%2C%22CSRA%22%2C%22CSX%22%2C%22CMI%22%2C%22CVS%22%2C%22DHI%22%2C%22DHR%22%2C%22DRI%22%2C%22DVA%22%2C%22DE%22%2C%22DLPH%22%2C%22DAL%22%2C%22XRAY%22%2C%22DVN%22%2C%22DO%22%2C%22DLR%22%2C%22DFS%22%2C%22DISCA%22%2C%22DISCK%22%2C%22DG%22%2C%22DLTR%22%2C%22D%22%2C%22DOV%22%2C%22DOW%22%2C%22DPS%22%2C%22DTE%22%2C%22DD%22%2C%22DUK%22%2C%22DNB%22%2C%22ETFC%22%2C%22EMN%22%2C%22ETN%22%2C%22EBAY%22%2C%22ECL%22%2C%22EIX%22%2C%22EW%22%2C%22EA%22%2C%22EMC%22%2C%22EMR%22%2C%22ENDP%22%2C%22ETR%22%2C%22EOG%22%2C%22EQT%22)&format=json&env=http%3A%2F%2Fdatatables.org%2Falltables.env&callback=')
    quotes1 = response1["query"]["results"]["quote"]
    # puts quotes1
    create_stocks(quotes1)

    response2 = HTTParty.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quotes%20where%20symbol%20in%20(%22EFX%22%2C%22EQIX%22%2C%22EQR%22%2C%22ESS%22%2C%22EL%22%2C%22ES%22%2C%22EXC%22%2C%22EXPE%22%2C%22EXPD%22%2C%22ESRX%22%2C%22EXR%22%2C%22XOM%22%2C%22FFIV%22%2C%22FB%22%2C%22FAST%22%2C%22FRT%22%2C%22FDX%22%2C%22FIS%22%2C%22FITB%22%2C%22FSLR%22%2C%22FE%22%2C%22FISV%22%2C%22FLIR%22%2C%22FLS%22%2C%22FLR%22%2C%22FMC%22%2C%22FTI%22%2C%22FL%22%2C%22F%22%2C%22FBHS%22%2C%22BEN%22%2C%22FCX%22%2C%22FTR%22%2C%22GPS%22%2C%22GRMN%22%2C%22GD%22%2C%22GE%22%2C%22GGP%22%2C%22GIS%22%2C%22GM%22%2C%22GPC%22%2C%22GILD%22%2C%22GPN%22%2C%22GS%22%2C%22GT%22%2C%22GWW%22%2C%22HAL%22%2C%22HBI%22%2C%22HOG%22%2C%22HAR%22%2C%22HRS%22%2C%22HIG%22%2C%22HAS%22%2C%22HCA%22%2C%22HCP%22%2C%22HP%22%2C%22HES%22%2C%22HPE%22%2C%22HOLX%22%2C%22HD%22%2C%22HON%22%2C%22HRL%22%2C%22HST%22%2C%22HPQ%22%2C%22HUM%22%2C%22HBAN%22%2C%22ITW%22%2C%22ILMN%22%2C%22IR%22%2C%22INTC%22%2C%22ICE%22%2C%22IBM%22%2C%22IP%22%2C%22IPG%22%2C%22IFF%22%2C%22INTU%22%2C%22ISRG%22%2C%22IVZ%22%2C%22IRM%22%2C%22JEC%22%2C%22JBHT%22%2C%22JNJ%22%2C%22JCI%22%2C%22JPM%22%2C%22JNPR%22%2C%22KSU%22%2C%22K%22%2C%22KEY%22%2C%22KMB%22%2C%22KIM%22%2C%22KMI%22%2C%22KLAC%22%2C%22KSS%22%2C%22KHC%22%2C%22KR%22%2C%22LB%22%2C%22LLL%22%2C%22LH%22%2C%22LRCX%22%2C%22LM%22%2C%22LEG%22%2C%22LEN%22%2C%22LVLT%22%2C%22LUK%22%2C%22LLY%22%2C%22LNC%22%2C%22LLTC%22%2C%22LKQ%22%2C%22LMT%22%2C%22L%22%2C%22LOW%22%2C%22LYB%22%2C%22MTB%22%2C%22MAC%22%2C%22M%22%2C%22MNK%22%2C%22MRO%22%2C%22MPC%22%2C%22MAR%22%2C%22MMC%22%2C%22MLM%22%2C%22MAS%22%2C%22MA%22%2C%22MAT%22%2C%22MKC%22%2C%22MCD%22%2C%22MCK%22%2C%22MJN%22%2C%22WRK%22%2C%22MDT%22%2C%22MRK%22%2C%22MET%22%2C%22KORS%22%2C%22MCHP%22%2C%22MU%22%2C%22MSFT%22%2C%22MHK%22%2C%22TAP%22%2C%22MDLZ%22%2C%22MON%22%2C%22MNST%22%2C%22MCO%22%2C%22MS%22%2C%22MOS%22%2C%22MSI%22%2C%22MUR%22%2C%22MYL%22%2C%22NDAQ%22%2C%22NOV%22%2C%22NAVI%22%2C%22NTAP%22%2C%22NFLX%22%2C%22NWL%22%2C%22NFX%22%2C%22NEM%22%2C%22NWSA%22%2C%22NWS%22%2C%22NEE%22%2C%22NLSN%22%2C%22NKE%22%2C%22NI%22%2C%22NBL%22%2C%22JWN%22%2C%22NSC%22%2C%22NTRS%22%2C%22NOC%22%2C%22NRG%22%2C%22NUE%22)&format=json&env=http%3A%2F%2Fdatatables.org%2Falltables.env&callback=")
    quotes2 = response2["query"]["results"]["quote"]
    create_stocks(quotes2)
    
    response3 = HTTParty.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quotes%20where%20symbol%20in%20(%22NVDA%22%2C%22ORLY%22%2C%22OXY%22%2C%22OMC%22%2C%22OKE%22%2C%22ORCL%22%2C%22OI%22%2C%22PCAR%22%2C%22PH%22%2C%22PDCO%22%2C%22PAYX%22%2C%22PYPL%22%2C%22PNR%22%2C%22PBCT%22%2C%22PEP%22%2C%22PKI%22%2C%22PRGO%22%2C%22PFE%22%2C%22PCG%22%2C%22PM%22%2C%22PSX%22%2C%22PNW%22%2C%22PXD%22%2C%22PBI%22%2C%22PNC%22%2C%22RL%22%2C%22PPG%22%2C%22PPL%22%2C%22PX%22%2C%22CFG%22%2C%22PCLN%22%2C%22PFG%22%2C%22PG%22%2C%22PGR%22%2C%22PLD%22%2C%22PRU%22%2C%22PEG%22%2C%22PSA%22%2C%22PHM%22%2C%22PVH%22%2C%22QRVO%22%2C%22PWR%22%2C%22QCOM%22%2C%22DGX%22%2C%22RRC%22%2C%22RTN%22%2C%22O%22%2C%22RHT%22%2C%22REGN%22%2C%22RF%22%2C%22RSG%22%2C%22RAI%22%2C%22RHI%22%2C%22ROK%22%2C%22COL%22%2C%22ROP%22%2C%22ROST%22%2C%22RCL%22%2C%22R%22%2C%22CRM%22%2C%22SCG%22%2C%22SLB%22%2C%22SNI%22%2C%22STX%22%2C%22SEE%22%2C%22SRE%22%2C%22SHW%22%2C%22SIG%22%2C%22SPG%22%2C%22SWKS%22%2C%22SLG%22%2C%22SJM%22%2C%22SNA%22%2C%22SO%22%2C%22LUV%22%2C%22SWN%22%2C%22SE%22%2C%22SPGI%22%2C%22STJ%22%2C%22SWK%22%2C%22SPLS%22%2C%22SBUX%22%2C%22HOT%22%2C%22STT%22%2C%22SRCL%22%2C%22SYK%22%2C%22STI%22%2C%22SYMC%22%2C%22SYF%22%2C%22SYY%22%2C%22TROW%22%2C%22TGT%22%2C%22TEL%22%2C%22TE%22%2C%22TGNA%22%2C%22TDC%22%2C%22TSO%22%2C%22TXN%22%2C%22TXT%22%2C%22HSY%22%2C%22TRV%22%2C%22TMO%22%2C%22TIF%22%2C%22TWX%22%2C%22TJX%22%2C%22TMK%22%2C%22TSS%22%2C%22TSCO%22%2C%22TDG%22%2C%22RIG%22%2C%22TRIP%22%2C%22FOXA%22%2C%22FOX%22%2C%22TSN%22%2C%22TYC%22%2C%22UDR%22%2C%22ULTA%22%2C%22USB%22%2C%22UA%22%2C%22UNP%22%2C%22UAL%22%2C%22UNH%22%2C%22UPS%22%2C%22URI%22%2C%22UTX%22%2C%22UHS%22%2C%22UNM%22%2C%22URBN%22%2C%22VFC%22%2C%22VLO%22%2C%22VAR%22%2C%22VTR%22%2C%22VRSN%22%2C%22VRSK%22%2C%22VZ%22%2C%22VRTX%22%2C%22VIAB%22%2C%22V%22%2C%22VNO%22%2C%22VMC%22%2C%22WMT%22%2C%22WBA%22%2C%22DIS%22%2C%22WM%22%2C%22WAT%22%2C%22ANTM%22%2C%22WFC%22%2C%22HCN%22%2C%22WDC%22%2C%22WU%22%2C%22WY%22%2C%22WHR%22%2C%22WFM%22%2C%22WMB%22%2C%22WLTW%22%2C%22WEC%22%2C%22WYN%22%2C%22WYNN%22%2C%22XEL%22%2C%22XRX%22%2C%22XLNX%22%2C%22XL%22%2C%22XYL%22%2C%22YHOO%22%2C%22YUM%22%2C%22ZBH%22%2C%22ZION%22%2C%22ZTS%22)&format=json&env=http%3A%2F%2Fdatatables.org%2Falltables.env&callback=")
    quotes3 = response3["query"]["results"]["quote"]
    create_stocks(quotes3)
    
    redirect_to '/stocks'
  end

  def update_all  
    response1 = HTTParty.get('https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quotes%20where%20symbol%20in%20(%22MMM%22%2C%22ABT%22%2C%22ABBV%22%2C%22ACN%22%2C%22ATVI%22%2C%22AYI%22%2C%22ADBE%22%2C%22AAP%22%2C%22AES%22%2C%22AET%22%2C%22AFL%22%2C%22AMG%22%2C%22A%22%2C%22GAS%22%2C%22APD%22%2C%22AKAM%22%2C%22ALK%22%2C%22AA%22%2C%22AGN%22%2C%22ALXN%22%2C%22ALLE%22%2C%22ADS%22%2C%22ALL%22%2C%22GOOGL%22%2C%22GOOG%22%2C%22MO%22%2C%22AMZN%22%2C%22AEE%22%2C%22AAL%22%2C%22AEP%22%2C%22AXP%22%2C%22AIG%22%2C%22AMT%22%2C%22AWK%22%2C%22AMP%22%2C%22ABC%22%2C%22AME%22%2C%22AMGN%22%2C%22APH%22%2C%22APC%22%2C%22ADI%22%2C%22AON%22%2C%22APA%22%2C%22AIV%22%2C%22AAPL%22%2C%22AMAT%22%2C%22ADM%22%2C%22AJG%22%2C%22AIZ%22%2C%22T%22%2C%22ADSK%22%2C%22ADP%22%2C%22AN%22%2C%22AZO%22%2C%22AVGO%22%2C%22AVB%22%2C%22AVY%22%2C%22BHI%22%2C%22BLL%22%2C%22BAC%22%2C%22BK%22%2C%22BCR%22%2C%22BAX%22%2C%22BBT%22%2C%22BDX%22%2C%22BBBY%22%2C%22BRK%22%2C%22BBY%22%2C%22BIIB%22%2C%22BLK%22%2C%22HRB%22%2C%22BA%22%2C%22BWA%22%2C%22BXP%22%2C%22BSX%22%2C%22BMY%22%2C%22BF%22%2C%22CHRW%22%2C%22CA%22%2C%22COG%22%2C%22CPB%22%2C%22COF%22%2C%22CAH%22%2C%22HSIC%22%2C%22KMX%22%2C%22CCL%22%2C%22CAT%22%2C%22CBG%22%2C%22CBS%22%2C%22CELG%22%2C%22CNC%22%2C%22CNP%22%2C%22CTL%22%2C%22CERN%22%2C%22CF%22%2C%22SCHW%22%2C%22CHK%22%2C%22CVX%22%2C%22CMG%22%2C%22CB%22%2C%22CHD%22%2C%22CI%22%2C%22XEC%22%2C%22CINF%22%2C%22CTAS%22%2C%22CSCO%22%2C%22C%22%2C%22CTXS%22%2C%22CLX%22%2C%22CME%22%2C%22CMS%22%2C%22COH%22%2C%22KO%22%2C%22CTSH%22%2C%22CL%22%2C%22CPGX%22%2C%22CMCSA%22%2C%22CMA%22%2C%22CAG%22%2C%22CXO%22%2C%22COP%22%2C%22ED%22%2C%22STZ%22%2C%22GLW%22%2C%22COST%22%2C%22CCI%22%2C%22CSRA%22%2C%22CSX%22%2C%22CMI%22%2C%22CVS%22%2C%22DHI%22%2C%22DHR%22%2C%22DRI%22%2C%22DVA%22%2C%22DE%22%2C%22DLPH%22%2C%22DAL%22%2C%22XRAY%22%2C%22DVN%22%2C%22DO%22%2C%22DLR%22%2C%22DFS%22%2C%22DISCA%22%2C%22DISCK%22%2C%22DG%22%2C%22DLTR%22%2C%22D%22%2C%22DOV%22%2C%22DOW%22%2C%22DPS%22%2C%22DTE%22%2C%22DD%22%2C%22DUK%22%2C%22DNB%22%2C%22ETFC%22%2C%22EMN%22%2C%22ETN%22%2C%22EBAY%22%2C%22ECL%22%2C%22EIX%22%2C%22EW%22%2C%22EA%22%2C%22EMC%22%2C%22EMR%22%2C%22ENDP%22%2C%22ETR%22%2C%22EOG%22%2C%22EQT%22)&format=json&env=http%3A%2F%2Fdatatables.org%2Falltables.env&callback=')
    quotes1 = response1["query"]["results"]["quote"]
    update_stocks(quotes1)

    response2 = HTTParty.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quotes%20where%20symbol%20in%20(%22EFX%22%2C%22EQIX%22%2C%22EQR%22%2C%22ESS%22%2C%22EL%22%2C%22ES%22%2C%22EXC%22%2C%22EXPE%22%2C%22EXPD%22%2C%22ESRX%22%2C%22EXR%22%2C%22XOM%22%2C%22FFIV%22%2C%22FB%22%2C%22FAST%22%2C%22FRT%22%2C%22FDX%22%2C%22FIS%22%2C%22FITB%22%2C%22FSLR%22%2C%22FE%22%2C%22FISV%22%2C%22FLIR%22%2C%22FLS%22%2C%22FLR%22%2C%22FMC%22%2C%22FTI%22%2C%22FL%22%2C%22F%22%2C%22FBHS%22%2C%22BEN%22%2C%22FCX%22%2C%22FTR%22%2C%22GPS%22%2C%22GRMN%22%2C%22GD%22%2C%22GE%22%2C%22GGP%22%2C%22GIS%22%2C%22GM%22%2C%22GPC%22%2C%22GILD%22%2C%22GPN%22%2C%22GS%22%2C%22GT%22%2C%22GWW%22%2C%22HAL%22%2C%22HBI%22%2C%22HOG%22%2C%22HAR%22%2C%22HRS%22%2C%22HIG%22%2C%22HAS%22%2C%22HCA%22%2C%22HCP%22%2C%22HP%22%2C%22HES%22%2C%22HPE%22%2C%22HOLX%22%2C%22HD%22%2C%22HON%22%2C%22HRL%22%2C%22HST%22%2C%22HPQ%22%2C%22HUM%22%2C%22HBAN%22%2C%22ITW%22%2C%22ILMN%22%2C%22IR%22%2C%22INTC%22%2C%22ICE%22%2C%22IBM%22%2C%22IP%22%2C%22IPG%22%2C%22IFF%22%2C%22INTU%22%2C%22ISRG%22%2C%22IVZ%22%2C%22IRM%22%2C%22JEC%22%2C%22JBHT%22%2C%22JNJ%22%2C%22JCI%22%2C%22JPM%22%2C%22JNPR%22%2C%22KSU%22%2C%22K%22%2C%22KEY%22%2C%22KMB%22%2C%22KIM%22%2C%22KMI%22%2C%22KLAC%22%2C%22KSS%22%2C%22KHC%22%2C%22KR%22%2C%22LB%22%2C%22LLL%22%2C%22LH%22%2C%22LRCX%22%2C%22LM%22%2C%22LEG%22%2C%22LEN%22%2C%22LVLT%22%2C%22LUK%22%2C%22LLY%22%2C%22LNC%22%2C%22LLTC%22%2C%22LKQ%22%2C%22LMT%22%2C%22L%22%2C%22LOW%22%2C%22LYB%22%2C%22MTB%22%2C%22MAC%22%2C%22M%22%2C%22MNK%22%2C%22MRO%22%2C%22MPC%22%2C%22MAR%22%2C%22MMC%22%2C%22MLM%22%2C%22MAS%22%2C%22MA%22%2C%22MAT%22%2C%22MKC%22%2C%22MCD%22%2C%22MCK%22%2C%22MJN%22%2C%22WRK%22%2C%22MDT%22%2C%22MRK%22%2C%22MET%22%2C%22KORS%22%2C%22MCHP%22%2C%22MU%22%2C%22MSFT%22%2C%22MHK%22%2C%22TAP%22%2C%22MDLZ%22%2C%22MON%22%2C%22MNST%22%2C%22MCO%22%2C%22MS%22%2C%22MOS%22%2C%22MSI%22%2C%22MUR%22%2C%22MYL%22%2C%22NDAQ%22%2C%22NOV%22%2C%22NAVI%22%2C%22NTAP%22%2C%22NFLX%22%2C%22NWL%22%2C%22NFX%22%2C%22NEM%22%2C%22NWSA%22%2C%22NWS%22%2C%22NEE%22%2C%22NLSN%22%2C%22NKE%22%2C%22NI%22%2C%22NBL%22%2C%22JWN%22%2C%22NSC%22%2C%22NTRS%22%2C%22NOC%22%2C%22NRG%22%2C%22NUE%22)&format=json&env=http%3A%2F%2Fdatatables.org%2Falltables.env&callback=")
    quotes2 = response2["query"]["results"]["quote"]
    update_stocks(quotes2)

    response3 = HTTParty.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quotes%20where%20symbol%20in%20(%22NVDA%22%2C%22ORLY%22%2C%22OXY%22%2C%22OMC%22%2C%22OKE%22%2C%22ORCL%22%2C%22OI%22%2C%22PCAR%22%2C%22PH%22%2C%22PDCO%22%2C%22PAYX%22%2C%22PYPL%22%2C%22PNR%22%2C%22PBCT%22%2C%22PEP%22%2C%22PKI%22%2C%22PRGO%22%2C%22PFE%22%2C%22PCG%22%2C%22PM%22%2C%22PSX%22%2C%22PNW%22%2C%22PXD%22%2C%22PBI%22%2C%22PNC%22%2C%22RL%22%2C%22PPG%22%2C%22PPL%22%2C%22PX%22%2C%22CFG%22%2C%22PCLN%22%2C%22PFG%22%2C%22PG%22%2C%22PGR%22%2C%22PLD%22%2C%22PRU%22%2C%22PEG%22%2C%22PSA%22%2C%22PHM%22%2C%22PVH%22%2C%22QRVO%22%2C%22PWR%22%2C%22QCOM%22%2C%22DGX%22%2C%22RRC%22%2C%22RTN%22%2C%22O%22%2C%22RHT%22%2C%22REGN%22%2C%22RF%22%2C%22RSG%22%2C%22RAI%22%2C%22RHI%22%2C%22ROK%22%2C%22COL%22%2C%22ROP%22%2C%22ROST%22%2C%22RCL%22%2C%22R%22%2C%22CRM%22%2C%22SCG%22%2C%22SLB%22%2C%22SNI%22%2C%22STX%22%2C%22SEE%22%2C%22SRE%22%2C%22SHW%22%2C%22SIG%22%2C%22SPG%22%2C%22SWKS%22%2C%22SLG%22%2C%22SJM%22%2C%22SNA%22%2C%22SO%22%2C%22LUV%22%2C%22SWN%22%2C%22SE%22%2C%22SPGI%22%2C%22STJ%22%2C%22SWK%22%2C%22SPLS%22%2C%22SBUX%22%2C%22HOT%22%2C%22STT%22%2C%22SRCL%22%2C%22SYK%22%2C%22STI%22%2C%22SYMC%22%2C%22SYF%22%2C%22SYY%22%2C%22TROW%22%2C%22TGT%22%2C%22TEL%22%2C%22TE%22%2C%22TGNA%22%2C%22TDC%22%2C%22TSO%22%2C%22TXN%22%2C%22TXT%22%2C%22HSY%22%2C%22TRV%22%2C%22TMO%22%2C%22TIF%22%2C%22TWX%22%2C%22TJX%22%2C%22TMK%22%2C%22TSS%22%2C%22TSCO%22%2C%22TDG%22%2C%22RIG%22%2C%22TRIP%22%2C%22FOXA%22%2C%22FOX%22%2C%22TSN%22%2C%22TYC%22%2C%22UDR%22%2C%22ULTA%22%2C%22USB%22%2C%22UA%22%2C%22UNP%22%2C%22UAL%22%2C%22UNH%22%2C%22UPS%22%2C%22URI%22%2C%22UTX%22%2C%22UHS%22%2C%22UNM%22%2C%22URBN%22%2C%22VFC%22%2C%22VLO%22%2C%22VAR%22%2C%22VTR%22%2C%22VRSN%22%2C%22VRSK%22%2C%22VZ%22%2C%22VRTX%22%2C%22VIAB%22%2C%22V%22%2C%22VNO%22%2C%22VMC%22%2C%22WMT%22%2C%22WBA%22%2C%22DIS%22%2C%22WM%22%2C%22WAT%22%2C%22ANTM%22%2C%22WFC%22%2C%22HCN%22%2C%22WDC%22%2C%22WU%22%2C%22WY%22%2C%22WHR%22%2C%22WFM%22%2C%22WMB%22%2C%22WLTW%22%2C%22WEC%22%2C%22WYN%22%2C%22WYNN%22%2C%22XEL%22%2C%22XRX%22%2C%22XLNX%22%2C%22XL%22%2C%22XYL%22%2C%22YHOO%22%2C%22YUM%22%2C%22ZBH%22%2C%22ZION%22%2C%22ZTS%22)&format=json&env=http%3A%2F%2Fdatatables.org%2Falltables.env&callback=")
    quotes3 = response3["query"]["results"]["quote"]
    update_stocks(quotes3)
    
    redirect_to '/stocks'
  end

  def search
    # fail
    search_string = "Stock"
    if params[:prmin]
      str = ".where(LastTradePriceOnly > #{params[:prmin]})"
      # str = "all"
      search_string += str
    end
    # # if params[:sharepricemin]
    # #   str = ".where(shareprice > #{params[:sharepricemin]}"
    # #   search_string += str
    # # end
    # # if params[:sharepricemin]
    # #   str = ".where(shareprice > #{params[:sharepricemin]}"
    # #   search_string += str
    # # end
    # render text: search_string
    # array = [search_string]
    # @stocks = array.each { |method| Stock.send(method) }
    @stocks = search_string.parameterize
  end

  def screen
    
  end

  private
  def stock_params
    # params.require(:stock).permit(:name, :description, :pricing).merge(category: @category )
  end

  def convert_billions_millions str
    if str
      if str.last == "B"
        num = str.to_f * 1000000000
      elsif str.last == "M"
        num = str.to_f * 1000000
      end
    end  
    return num    
  end

  def create_stocks arr
    arr.each do |s|

      Stock.create(
        symbol:  s['symbol'],
        AverageDailyVolume: s['AverageDailyVolume'],
        BookValue:s['BookValue'], 
        Change:s['Change'], 
        DividendShare:s['DividendShare'], 
        LastTradeDate:s['LastTradeDate'], 
        EarningsShare:s['EarningsShare'], 
        EPSEstimateCurrentYear:s['EPSEstimateCurrentYear'], 
        EPSEstimateNextYear:s['EPSEstimateNextYear'], 
        EPSEstimateNextQuarter:s['EPSEstimateNextQuarter'], 
        DaysLow:s['DaysLow'], 
        DaysHigh:s['DaysHigh'], 
        YearLow:s['YearLow'], 
        YearHigh:s['YearHigh'], 
        MarketCapitalization:s['MarketCapitalization'], 
        EBITDA:s['EBITDA'], 
        ChangeFromYearLow:s['ChangeFromYearLow'], 
        PercentChangeFromYearLow:s['PercentChangeFromYearLow'], 
        ChangeFromYearHigh:s['ChangeFromYearHigh'], 
        PercebtChangeFromYearHigh:s['PercebtChangeFromYearHigh'], 
        LastTradePriceOnly:s['LastTradePriceOnly'], 
        FiftydayMovingAverage:s['FiftydayMovingAverage'], 
        TwoHundreddayMovingAverage:s['TwoHundreddayMovingAverage'], 
        ChangeFromTwoHundreddayMovingAverage:s['ChangeFromTwoHundreddayMovingAverage'], 
        PercentChangeFromTwoHundreddayMovingAverage:s['PercentChangeFromTwoHundreddayMovingAverage'], 
        ChangeFromFiftydayMovingAverage:s['ChangeFromFiftydayMovingAverage'], 
        PercentChangeFromFiftydayMovingAverage:s['PercentChangeFromFiftydayMovingAverage'], 
        Name:s['Name'], 
        Open:s['Open'], 
        PreviousClose:s['PreviousClose'], 
        PriceSales:s['PriceSales'], 
        PriceBook:s['PriceBook'], 
        PERatio:s['PERatio'], 
        PEGRatio:s['PEGRatio'], 
        PriceEPSEstimateCurrentYear:s['PriceEPSEstimateCurrentYear'], 
        PriceEPSEstimateNextYear:s['PriceEPSEstimateNextYear'], 
        OneyrTargetPrice:s['OneyrTargetPrice'], 
        Volume:s['Volume'], 
        YearRange:s['YearRange'], 
        DividendYield:s['DividendYield'], 
        PercentChange:s['PercentChange'],
        MarketCapNumber: convert_billions_millions(s['MarketCapitalization']) #,
        # EstimatedOneYearEPSGrowth: ((s['EPSEstimateNextYear'].to_f / s['EPSEstimateCurrentYear'].to_f) - 1 )
        ) 
    end
  end

  def update_stocks arr
    arr.each do |s|
      estimate1 = s['EPSEstimateNextYear'].to_f
      estimate2 = s['EPSEstimateCurrentYear'].to_f
      diff = estimate1 - estimate2

      estimate_result = diff / estimate2
      Stock.find_by(symbol: s['symbol']).update(
        AverageDailyVolume: s['AverageDailyVolume'],
        BookValue:s['BookValue'], 
        Change:s['Change'], 
        DividendShare:s['DividendShare'], 
        LastTradeDate:s['LastTradeDate'], 
        EarningsShare:s['EarningsShare'], 
        EPSEstimateCurrentYear:s['EPSEstimateCurrentYear'], 
        EPSEstimateNextYear:s['EPSEstimateNextYear'], 
        EPSEstimateNextQuarter:s['EPSEstimateNextQuarter'], 
        DaysLow:s['DaysLow'], 
        DaysHigh:s['DaysHigh'], 
        YearLow:s['YearLow'], 
        YearHigh:s['YearHigh'], 
        MarketCapitalization:s['MarketCapitalization'], 
        EBITDA:s['EBITDA'], 
        ChangeFromYearLow:s['ChangeFromYearLow'], 
        PercentChangeFromYearLow:s['PercentChangeFromYearLow'], 
        ChangeFromYearHigh:s['ChangeFromYearHigh'], 
        PercebtChangeFromYearHigh:s['PercebtChangeFromYearHigh'], 
        LastTradePriceOnly:s['LastTradePriceOnly'], 
        FiftydayMovingAverage:s['FiftydayMovingAverage'], 
        TwoHundreddayMovingAverage:s['TwoHundreddayMovingAverage'], 
        ChangeFromTwoHundreddayMovingAverage:s['ChangeFromTwoHundreddayMovingAverage'], 
        PercentChangeFromTwoHundreddayMovingAverage:s['PercentChangeFromTwoHundreddayMovingAverage'], 
        ChangeFromFiftydayMovingAverage:s['ChangeFromFiftydayMovingAverage'], 
        PercentChangeFromFiftydayMovingAverage:s['PercentChangeFromFiftydayMovingAverage'], 
        Name:s['Name'], 
        Open:s['Open'], 
        PreviousClose:s['PreviousClose'], 
        PriceSales:s['PriceSales'], 
        PriceBook:s['PriceBook'], 
        PERatio:s['PERatio'], 
        PEGRatio:s['PEGRatio'], 
        PriceEPSEstimateCurrentYear:s['PriceEPSEstimateCurrentYear'], 
        PriceEPSEstimateNextYear:s['PriceEPSEstimateNextYear'], 
        OneyrTargetPrice:s['OneyrTargetPrice'], 
        Volume:s['Volume'], 
        YearRange:s['YearRange'], 
        DividendYield:s['DividendYield'], 
        PercentChange:s['PercentChange'],
        MarketCapNumber: convert_billions_millions(s['MarketCapitalization']),
        EstimatedOneYearEPSGrowth: estimate_result
        ) 
    end
  end

end
