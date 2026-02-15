' * ************
' * c866utf8
' * ************
' * Данная программа, написанная на языке программирования
' * MS-DOS QBasic, ver. 1.0, представляет собой утилиту,
' * которая конвертирует текст с MIME-типом "plain/text"
' * из кодировки CP866 (она же - Windows-1251) в кодировку
' * UTF-8 (она же - 65001).
' * Программа после запуска запрашивает имя входящего и имя
' * исходящего файлов, после чего, собственно говоря, и
' * выполняется конвертация содержимое входных данных из
' * одной кодировки в другую.
' * В исходный код программы встроена таблица преобразований
' * (она же - таблица соответствий) для работы с кодировкой
' * UTF-8.
' *
' * @author Ефремов А. В., 15.02.2026

PRINT "************"
PRINT "КОНВЕРТАЦИЯ CP866 -> UTF-8"
PRINT "************"
PRINT

DIM errorlevel AS INTEGER: ' код последней ошибки
DIM fileSize AS LONG, filePos AS LONG, readFile AS STRING * 1
DIM oneByteString AS STRING * 1, twoByteString AS STRING * 2
ON ERROR GOTO errorHandler

' загрузка таблицы преобразований
PRINT "Загрузка таблицы преобразований... ";
DIM utf8Lower%(255), utf8Upper%(255), utf8Size%(255)
FOR cnt% = 0 TO 255
  READ utf8Lower%(cnt%), utf8Upper%(cnt%), utf8Size%(cnt%)
NEXT cnt%
PRINT "Готово."

' входные данные
LINE INPUT "Имя входящего файла> ", inputFile$
LINE INPUT "Имя исходящего файла> ", outputFile$
IF inputFile$ = "" OR outputFile$ = "" OR inputFile$ = outputFile$ THEN GOTO lQuit

' проверка существования обоих файлов
LET fileSize = 0
LET errorlevel = 0
OPEN inputFile$ FOR INPUT AS #1
  IF errorlevel <> 0 THEN GOTO noFileError
LET fileSize = LOF(1): ' размер входящего файла (в байтах)
CLOSE #1
LET errorlevel = 0
OPEN outputFile$ FOR INPUT AS #1
  IF errorlevel <> 0 THEN GOTO delFile
CLOSE #1

' процесс конвертации
1  PRINT "Начался процесс конвертации..."
OPEN inputFile$ FOR BINARY AS #1 LEN = 1
OPEN outputFile$ FOR BINARY AS #2 LEN = 2
LET filePos = SEEK(1)
WHILE fileSize > 0 AND filePos <= fileSize
  GET #1, filePos, readFile
  LET filePos = SEEK(1)
  LET idx% = ASC(readFile)
  IF utf8Size%(idx%) = 1 THEN
    LET oneByteString = CHR$(utf8Lower%(idx%))
    PUT #2, SEEK(2), oneByteString
  ELSE
    LET twoByteString = CHR$(utf8Lower%(idx%)) + CHR$(utf8Upper%(idx%))
    PUT #2, SEEK(2), twoByteString
  END IF
WEND
CLOSE #2: CLOSE #1
PRINT "Конвертация завершена."

lQuit:
PRINT "Работа программы завершена."
END

noFileError:
PRINT "Файл не найден.": GOTO lQuit

delFile:
KILL outputFile$: GOTO 1

errorHandler:
LET errorlevel = ERR: RESUME NEXT

REM --------------------------------------------
REM 256 ОПЕРАТОРОВ DATA:
REM CP866 INDEX (0 .. 255) -> UTF-8 BYTES (CHR$())
REM --------------------------------------------
DATA 0, 0, 1
DATA 1, 0, 1
DATA 2, 0, 1
DATA 3, 0, 1
DATA 4, 0, 1
DATA 5, 0, 1
DATA 6, 0, 1
DATA 7, 0, 1
DATA 8, 0, 1
DATA 9, 0, 1
DATA 10, 0, 1
DATA 11, 0, 1
DATA 12, 0, 1
DATA 13, 0, 1
DATA 14, 0, 1
DATA 15, 0, 1
DATA 16, 0, 1
DATA 17, 0, 1
DATA 18, 0, 1
DATA 19, 0, 1
DATA 20, 0, 1
DATA 21, 0, 1
DATA 22, 0, 1
DATA 23, 0, 1
DATA 24, 0, 1
DATA 25, 0, 1
DATA 26, 0, 1
DATA 27, 0, 1
DATA 28, 0, 1
DATA 29, 0, 1
DATA 30, 0, 1
DATA 31, 0, 1
DATA 32, 0, 1
DATA 33, 0, 1
DATA 34, 0, 1
DATA 35, 0, 1
DATA 36, 0, 1
DATA 37, 0, 1
DATA 38, 0, 1
DATA 39, 0, 1
DATA 40, 0, 1
DATA 41, 0, 1
DATA 42, 0, 1
DATA 43, 0, 1
DATA 44, 0, 1
DATA 45, 0, 1
DATA 46, 0, 1
DATA 47, 0, 1
DATA 48, 0, 1
DATA 49, 0, 1
DATA 50, 0, 1
DATA 51, 0, 1
DATA 52, 0, 1
DATA 53, 0, 1
DATA 54, 0, 1
DATA 55, 0, 1
DATA 56, 0, 1
DATA 57, 0, 1
DATA 58, 0, 1
DATA 59, 0, 1
DATA 60, 0, 1
DATA 61, 0, 1
DATA 62, 0, 1
DATA 63, 0, 1
DATA 64, 0, 1
DATA 65, 0, 1
DATA 66, 0, 1
DATA 67, 0, 1
DATA 68, 0, 1
DATA 69, 0, 1
DATA 70, 0, 1
DATA 71, 0, 1
DATA 72, 0, 1
DATA 73, 0, 1
DATA 74, 0, 1
DATA 75, 0, 1
DATA 76, 0, 1
DATA 77, 0, 1
DATA 78, 0, 1
DATA 79, 0, 1
DATA 80, 0, 1
DATA 81, 0, 1
DATA 82, 0, 1
DATA 83, 0, 1
DATA 84, 0, 1
DATA 85, 0, 1
DATA 86, 0, 1
DATA 87, 0, 1
DATA 88, 0, 1
DATA 89, 0, 1
DATA 90, 0, 1
DATA 91, 0, 1
DATA 92, 0, 1
DATA 93, 0, 1
DATA 94, 0, 1
DATA 95, 0, 1
DATA 96, 0, 1
DATA 97, 0, 1
DATA 98, 0, 1
DATA 99, 0, 1
DATA 100, 0, 1
DATA 101, 0, 1
DATA 102, 0, 1
DATA 103, 0, 1
DATA 104, 0, 1
DATA 105, 0, 1
DATA 106, 0, 1
DATA 107, 0, 1
DATA 108, 0, 1
DATA 109, 0, 1
DATA 110, 0, 1
DATA 111, 0, 1
DATA 112, 0, 1
DATA 113, 0, 1
DATA 114, 0, 1
DATA 115, 0, 1
DATA 116, 0, 1
DATA 117, 0, 1
DATA 118, 0, 1
DATA 119, 0, 1
DATA 120, 0, 1
DATA 121, 0, 1
DATA 122, 0, 1
DATA 123, 0, 1
DATA 124, 0, 1
DATA 125, 0, 1
DATA 126, 0, 1
DATA 127, 0, 1
DATA 208, 144, 2: ' А (128)
DATA 208, 145, 2: ' Б (129)
DATA 208, 146, 2
DATA 208, 147, 2
DATA 208, 148, 2
DATA 208, 149, 2
DATA 208, 150, 2
DATA 208, 151, 2
DATA 208, 152, 2
DATA 208, 153, 2
DATA 208, 154, 2
DATA 208, 155, 2
DATA 208, 156, 2
DATA 208, 157, 2
DATA 208, 158, 2
DATA 208, 159, 2
DATA 208, 160, 2
DATA 208, 161, 2
DATA 208, 162, 2
DATA 208, 163, 2
DATA 208, 164, 2
DATA 208, 165, 2
DATA 208, 166, 2
DATA 208, 167, 2
DATA 208, 168, 2
DATA 208, 169, 2
DATA 208, 170, 2
DATA 208, 171, 2
DATA 208, 172, 2
DATA 208, 173, 2
DATA 208, 174, 2
DATA 208, 175, 2: ' Я (159)
DATA 208, 176, 2: ' а (160)
DATA 208, 177, 2
DATA 208, 178, 2
DATA 208, 179, 2
DATA 208, 180, 2
DATA 208, 181, 2
DATA 208, 182, 2
DATA 208, 183, 2
DATA 208, 184, 2
DATA 208, 185, 2
DATA 208, 186, 2
DATA 208, 187, 2
DATA 208, 188, 2
DATA 208, 189, 2
DATA 208, 190, 2
DATA 208, 191, 2: ' п (175)
DATA 209, 176, 2
DATA 209, 177, 2
DATA 209, 178, 2
DATA 209, 179, 2
DATA 209, 180, 2
DATA 209, 181, 2
DATA 209, 182, 2
DATA 209, 183, 2
DATA 209, 184, 2
DATA 209, 185, 2
DATA 209, 186, 2
DATA 209, 187, 2
DATA 209, 188, 2
DATA 209, 189, 2
DATA 209, 190, 2
DATA 209, 191, 2
DATA 209, 192, 2
DATA 208, 129, 2
DATA 208, 130, 2
DATA 208, 131, 2
DATA 208, 132, 2
DATA 208, 133, 2
DATA 208, 134, 2
DATA 208, 135, 2
DATA 208, 136, 2
DATA 208, 137, 2
DATA 208, 138, 2
DATA 208, 139, 2
DATA 208, 140, 2
DATA 208, 141, 2
DATA 208, 142, 2
DATA 208, 143, 2
DATA 208, 144, 2
DATA 208, 145, 2
DATA 208, 146, 2
DATA 208, 147, 2
DATA 208, 148, 2
DATA 208, 149, 2
DATA 208, 150, 2
DATA 208, 151, 2
DATA 208, 152, 2
DATA 208, 153, 2
DATA 208, 154, 2
DATA 208, 155, 2
DATA 208, 156, 2
DATA 208, 157, 2
DATA 208, 158, 2
DATA 208, 159, 2
DATA 209, 128, 2: ' р (224)
DATA 209, 129, 2
DATA 209, 130, 2
DATA 209, 131, 2
DATA 209, 132, 2
DATA 209, 133, 2
DATA 209, 134, 2: ' ц (230)
DATA 209, 135, 2: ' ч
DATA 209, 136, 2: ' ш
DATA 209, 137, 2: ' щ
DATA 209, 138, 2: ' ъ
DATA 209, 139, 2: ' ы
DATA 209, 140, 2: ' ь
DATA 209, 141, 2: ' э
DATA 209, 142, 2: ' ю (238)
DATA 209, 143, 2: ' я (239)
DATA 208, 129, 2: ' Ё (240)
DATA 209, 145, 2: ' ё (241)
DATA 226, 146, 2
DATA 226, 147, 2
DATA 226, 148, 2
DATA 226, 149, 2
DATA 226, 150, 2
DATA 226, 151, 2
DATA 226, 152, 2
DATA 226, 153, 2
DATA 226, 154, 2
DATA 226, 155, 2
DATA 226, 156, 2
DATA 226, 157, 2
DATA 226, 158, 2
DATA 226, 159, 2
