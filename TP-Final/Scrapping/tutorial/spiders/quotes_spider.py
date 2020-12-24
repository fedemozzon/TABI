import scrapy
import csv


class QuotesSpider(scrapy.Spider):
    name = "quotes"

    def start_requests(self):
        urls = [
            'https://en.wikipedia.org/wiki/List_of_cities_by_average_temperature',
            'https://en.wikipedia.org/wiki/List_of_cities_by_sunshine_duration'
        ]
        for url in urls:
            yield scrapy.Request(url=url, callback=self.parse)

    def parse(self, response):
        continentes = {
            0:"Africa",
            1:"Asia",
            2:"Europa",
            3:"Centro América y América del Norte",
            4:"Sudamérica",
            5:"Oceanía"

        }
        page = response.url.split("/")[-2]
        filename = f'quotes-{page}.html'
        for number in range(0,6):
            a_selectors = response.css("table.wikitable")[number].css('tbody').css('tr')
            for index in range(len(a_selectors)):
                pais = ''
                promedio_anual = '' 
                columna = (a_selectors[index]).css('td')
                for index2 in range(len(columna)):
                    if(index2 < 1):
                        pais = columna[index2].css('a').attrib['title']
                    elif(index2 == 14):
                        promedio_anual = columna[index2].css('td::text').get()
                print(pais)
                print(promedio_anual)
                if(pais != ''):
                    with open('horas_de_sol.csv', mode='a') as mundial_luzSolar_promedio_por_anio_file:
                        mundial_luzSolar_promedio_por_anio_file = csv.writer(mundial_luzSolar_promedio_por_anio_file)
                        mundial_luzSolar_promedio_por_anio_file.writerow([pais,continentes.get(number), promedio_anual])