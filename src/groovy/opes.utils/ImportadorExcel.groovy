package opes.utils

import org.grails.plugins.excelimport.AbstractExcelImporter
import org.grails.plugins.excelimport.ExcelImportService

/**
 * User: Jorge Omar Bautista Valenzuela
 * Date: 16/08/12
 * Time: 14:33
 */
class ImportadorExcel extends AbstractExcelImporter{

    def excelImportService = new ExcelImportService()

    public ImportadorExcel(fileName) {
        super(fileName)
    }

    List<Map> getList(final Map CONFIG_COLUMN_MAP) {
        List list = excelImportService.columns(workbook, CONFIG_COLUMN_MAP)
    }

    Map getMapParams(final Map CONFIG_CELL_MAP) {
        Map mapParams = excelImportService.cells(workbook, CONFIG_CELL_MAP )
    }
}
