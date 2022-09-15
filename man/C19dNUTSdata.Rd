\name{C19dNUTSdata}
\alias{C19dNUTSdata}
\docType{data}
\title{
Regional COVID-19 deaths per 100,000 pop
}

\description{
Cumulative COVID-19 deaths absolute and per 100,000 pop at NUTS3 level
}


\usage{data("C19dNUTSdata")}

\format{
  A data frame with 1,143 observations (each one represents a spatial NUTS unit).
  \describe{
    \item{\code{NUTS_ID}}{NUTS ID of the spatial unit}
    \item{\code{CNTR_CODE}}{Country code (= NUTS 0 ID) of the given spatial unit}
    \item{\code{NUTS_Level}}{NUTS level of the given spatial unit (0 = national, 1, 2, 3)}
    \item{\code{NUTS2_ID}}{NUTS 2 ID of the spatial unit}
    \item{\code{NUTS1_ID}}{NUTS 1 ID of the spatial unit}
    \item{\code{NUTS_Name}}{Latin name of the spatial unit}
    \item{\code{C19deaths}}{Cumulative COVID-19 deaths [persons]}
    \item{\code{pop2020}}{Population in 2020 [persons]}
    \item{\code{C19deaths_per100000}}{Cumulative COVID-19 deaths [per 100,000]}
    \item{\code{annotation}}{Annotation}
)}
}

\details{
The dataset contains cumulative COVID-19 deaths (absolute: \code{C19deaths}, per 100,000 pop: \code{C19deaths_per100000}) at the regional level (mostly NUTS 3) for 31 EU/EFTA countries (AT, BE, BG, CH, CY, CZ, DE, DK, EE, EL, ES, FI, FR, HR, HU, IE, IS, IT, LT, LU, LV, MT, NL, NO, PL, PT, RO, SE, SI, SK, UK). Unless otherwise noted, data includes all reported COVID-19-associated deaths since the beginning of the COVID-19 pandemic through approximately mid-June 2022. Please refer to the source section for the exact date on which each raw dataset was retrieved.

In some cases, countries publish regional COVID-19 data directly at NUTS3 level (e.g., Germany) or NUTS2 level (e.g., Italy). In other cases, the regional level had to be linked manually (e.g., Norway, Switzerland). Some countries even publish the relevant data on a smaller scale, i.e. below NUTS3 (e.g., Austria, Poland, England). In these cases, where a reference table was available, the lower level was linked to the NUTS3 level (e.g., England). If no reference table but a lower level shapefile was available, the lower level was linked to the NUTS3 level via a spatial join using QGIS (e.g., Poland). 

Data on COVID-19 deaths are incomplete for the following EU/EFTA countries: Bulgaria, France, Poland. In Bulgaria, regional COVID-19 deaths were only published for the years 2020 and 2021, i.e. the cases for 2022 are missing. France only publishes the COVID-19 deaths that did NOT die in a nursing home at regional level, i.e. there is a lack of people who died in nursing homes from/with COVID-19. Polish deaths are missing COVID-19 deaths from the first pandemic wave; therefore only the COVID-19 fatalities from the date 2020-11-24 are included. The following EU/EFTA countries have not published sub-national data for COVID-19 deaths: Finland, Island, Hungary, Estonia, Latvia, Malta. The values for these countries refer to the national level (NUTS 0), which is indicated by the variable \code{NUTS_Level} = 0. Norway does not provide COVID-19 data for the NUTS3 regions NO0B1 and NO0B2.

The data set can be linked directly to the EU NUTS Shapefile (\url{https://ec.europa.eu/eurostat/web/gisco/geodata/reference-data/administrative-units-statistical-units/nuts}; accessed 2022-06-23). The connection is made via the \code{NUTS_ID} column. However, there is one exception: To ensure data compatibility, the British NUTS3 regions UKM61 and UKM63 were aggregated into one region (UKM61).

The data reflects 1,309,326 COVID-19 related deaths in the 31 countries in the investigated time period. The variable \code{C19deaths_per100000} is non-normally distributed (Shapiro-Wilk test: W = 0.92284, p < 0.01). The natural log of \code{C19deaths_per100000} is spatially autocorrelated (Moran's I with queen contiguous spatial weighting: I = 0.65228, p < 0.01).
}

\source{
Raw data of COVID-19 deaths:

AT: \url{https://covid19-dashboard.ages.at/data/CovidFaelle_Timeline_GKZ.csv} (accessed 2022-06-23)

BE: \url{https://epistat.sciensano.be/Data/COVID19BE_MORT.csv} (accessed 2022-06-21)

BG: \url{https://www.nsi.bg/sites/default/files/files/data/table/COVID_2020_2021_EN.xls} (accessed 2022-06-29)

CH: \url{https://www.covid19.admin.ch/api/data/20220621-t6j901v4/downloads/sources-csv.zip} (accessed 2022-06-21)

CY: \url{https://covid19.who.int/region/euro/country/cy} (accessed 2022-06-30)

CZ: \url{https://onemocneni-aktualne.mzcr.cz/api/v2/covid-19/umrti.csv} (accessed 2022-06-24)

DE: \url{https://npgeo-corona-npgeo-de.hub.arcgis.com/datasets/917fc37a709542548cc3be077a786c17_0/about} (accessed 2022-06-23)

DK: \url{https://files.ssi.dk/covid19/overvagning/dashboard/overvaagningsdata-dashboard-covid19-28062022-byis} (accessed 2022-06-29), folder: "Regionalt_DB", file: "07_antal_doede_pr_dag_pr_region"

EE: \url{https://www.terviseamet.ee/en/coronavirus/coronavirus-dataset} (accessed 2022-07-11)

EL: \url{https://github.com/Sandbird/covid19-Greece} (accessed 2022-07-02), file "regions"

ES: \url{https://cnecovid.isciii.es/covid19/resources/casos_hosp_uci_def_sexo_edad_provres.csv} (accesssed 2022-06-28)

FI: \url{https://covid19.who.int/region/euro/country/fi} (accessed 2022-07-01)

FR: \url{https://www.data.gouv.fr/fr/datasets/synthese-des-indicateurs-de-suivi-de-lepidemie-covid-19/} (accessed 2022-07-01), file "table-indicateurs-open-data-dep-2022-06-30-19h00"

HR: \url{https://www.koronavirus.hr/zupanije/139} (accessed 2022-06-28)

HU: \url{https://covid19.who.int/region/euro/country/hu} (accessed 2022-07-02)

IE: \url{https://epi-covid-19-hpscireland.hub.arcgis.com/} (accessed 2022-06-29)

IS: \url{https://www.covid.is/data} (accessed 2022-06-27)

IT: \url{https://github.com/pcm-dpc/COVID-19/tree/master/dati-regioni} (accessed 2022-06-24), file "dpc-covid19-ita-regioni-latest_raw"

LV: \url{https://covid19.gov.lv/en/node/16387} (accessed 2022-07-27)

LT: \url{https://open-data-ls-osp-sdg.hub.arcgis.com/datasets/ba35de03e111430f88a86f7d1f351de6_0/explore} (accessed 2022-06-27)

LU: \url{https://covid19.public.lu/fr/graph.html} (accessed 2022-06-27)

MT: \url{https://covid19.who.int/table} (accessed 2022-07-01)

NL: \url{https://data.rivm.nl/covid-19/COVID-19_aantallen_gemeente_per_dag.csv} (accessed 2022-06-27)

NO: \url{https://www.fhi.no/contentassets/8a971e7b0a3c4a06bdbf381ab52e6157/vedlegg/2022/ukerapport-uke-20-16.05---22.05.22.pdf} (accessed 2022-07-07)

PL: \url{https://www.gov.pl/web/koronawirus/wykaz-zarazen-koronawirusem-sars-cov-2} (accessed 2022-06-23)

PT: \url{https://github.com/dssg-pt/covid19pt-data/blob/master/data.csv} (accessed 2022-06-29)

RO: \url{https://covid19.geo-spatial.org/?map=decese} (accessed 2022-07-01)

SE: \url{https://experience.arcgis.com/experience/19fc7e3f61ec4e86af178fe2275029c5} (accessed 2022-06-23)

SI: \url{https://www.nijz.si/sites/www.nijz.si/files/uploaded/tedenski_prikaz_umrli20220627.xlsx} (accessed 2022-06-28)

SK: \url{https://github.com/Institut-Zdravotnych-Analyz/covid19-data} (accessed 2022-06-28), folder "Deaths", file "OpenData_Slovakia_Covid_Deaths_AgeGroup_District"

UK - England: \url{https://coronavirus.data.gov.uk/details/deaths} (accessed 2022-06-24), file "ltla_2022_06_23_cumDeaths60DaysByDeathDate_ref"

UK - Northern Ireland: \url{https://www.nisra.gov.uk/system/files/statistics/Weekly_Deaths\%20-\%20w\%20e\%2017th\%20June\%202022.XLSX} (accessed 2022-07-01)

UK - Scotland: \url{https://www.nrscotland.gov.uk/files//statistics/covid19/covid-deaths-22-data-week-25.xlsx} (data for 2021-2022) and \url{https://www.nrscotland.gov.uk/files//statistics/covid19/covid-deaths-20-data-final.xlsx} (data for 2022) (accessed 2022-07-01)

UK - Wales: \url{https://public.tableau.com/app/profile/public.health.wales.health.protection/viz/COVID-19Rapidmortalitydata/Summary} (accessed 2022-07-04)
}


\examples{
data(C19dNUTSdata)

# Summary:
summary(C19dNUTSdata)

# Check for normal distribution:
hist(C19dNUTSdata$C19deaths_per100000)
shapiro.test(C19dNUTSdata$C19deaths_per100000)

# no. of regions for each country:
table(C19dNUTSdata$CNTR_CODE)
# only for countries with data on at least NUTS 2 level:
table(C19dNUTSdata[C19dNUTSdata$NUTS_Level > 1,]$CNTR_CODE)

}

\keyword{datasets}