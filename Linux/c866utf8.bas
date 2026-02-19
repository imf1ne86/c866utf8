' * ************
' * c866utf8
' * ************
' * Данная программа, написанная на языке программирования
' * FreeBASIC, представляет собой утилиту,
' * которая конвертирует текст с MIME-типом "plain/text"
' * из кодировки CP866 (она же - Windows-1251) в кодировку
' * UTF-8 (она же - 65001).
' * Программа после запуска запрашивает имя входящего и имя
' * исходящего файлов, после чего, собственно говоря, и
' * выполняется конвертация содержимого входных данных из
' * одной кодировки в другую.
' * В исходный код программы встроена таблица преобразований
' * (она же - таблица соответствий) для работы с кодировкой
' * UTF-8.
' *
' * @author Ефремов А. В., 18.02.2026

#include "file.bi"

Declare Sub SayIt(txt As String, newline As Boolean = True)

SayIt("************")
SayIt("КОНВЕРТАЦИЯ CP866 -> UTF-8")
SayIt("************")

' загрузка таблицы преобразований
SayIt("Загрузка таблицы преобразований... ", False)
Type Utf8Table
  utf8Lower(255) As Ulong
  utf8Upper(255) As Ulong
  utf8Size(255) As UByte
End Type
Dim tblUtf8 As Utf8Table
For cnt As UShort = 0 To 255
  Read tblUtf8.utf8Lower(cnt), tblUtf8.utf8Upper(cnt), tblUtf8.utf8Size(cnt)
Next cnt
SayIt("Готово.")

' входные данные
Dim inputFile As String, outputFile As String
SayIt("Имя входящего файла> ", False): Line Input inputFile
SayIt("Имя исходящего файла> ", False): Line Input outputFile
If Not ((inputFile = "") Or (outputFile = "") Or (inputFile = outputFile)) Then
  ' проверка существования файла
  If FileExists(inputFile) <> 0 Then
    ' процесс конвертации
    SayIt("Начался процесс конвертации...")
    Dim As LongInt fileSize, filePos
    Dim pieceOfFile As String * 1
    Kill outputFile
    Open inputFile For Binary As #1 Len = 1
    Open outputFile For Binary As #2 Len = 2
      fileSize = Lof(1)
      filePos = Seek(1)
      While ((fileSize > 0) And (filePos <= fileSize))
        Get #1, filePos, pieceOfFile
        filePos = Seek(1)
        Dim As UShort idx = Asc(pieceOfFile)
        If tblUtf8.utf8Size(idx) = 1 Then
          pieceOfFile = Chr(tblUtf8.utf8Lower(idx))
          Put #2, Seek(2), pieceOfFile
        Else
          Dim As String twoByteString = Chr(tblUtf8.utf8Lower(idx)) & Chr(tblUtf8.utf8Upper(idx))
          Put #2, Seek(2), twoByteString
        End If
      Wend
    Close #2
    Close #1
    SayIt("Конвертация завершена.")
  Else
    SayIt("Файл не найден.")
  End If
Else
  SayIt("Неверные имена файлов.")
End If

SayIt("Работа программы завершена.")
End

Sub SayIt(txt As String, newline As Boolean = True)
  If newline Then
    Print txt
  Else
    Print txt;
  End If
End Sub

Rem --------------------------------------------
Rem 256 ОПЕРАТОРОВ DATA:
Rem CP866 INDEX (0 .. 255) -> UTF-8 BYTES (CHR$())
Rem --------------------------------------------
Data 0, 0, 1
Data 1, 0, 1
Data 2, 0, 1
Data 3, 0, 1
Data 4, 0, 1
Data 5, 0, 1
Data 6, 0, 1
Data 7, 0, 1
Data 8, 0, 1
Data 9, 0, 1
Data 10, 0, 1
Data 11, 0, 1
Data 12, 0, 1
Data 13, 0, 1
Data 14, 0, 1
Data 15, 0, 1
Data 16, 0, 1
Data 17, 0, 1
Data 18, 0, 1
Data 19, 0, 1
Data 20, 0, 1
Data 21, 0, 1
Data 22, 0, 1
Data 23, 0, 1
Data 24, 0, 1
Data 25, 0, 1
Data 26, 0, 1
Data 27, 0, 1
Data 28, 0, 1
Data 29, 0, 1
Data 30, 0, 1
Data 31, 0, 1
Data 32, 0, 1
Data 33, 0, 1
Data 34, 0, 1
Data 35, 0, 1
Data 36, 0, 1
Data 37, 0, 1
Data 38, 0, 1
Data 39, 0, 1
Data 40, 0, 1
Data 41, 0, 1
Data 42, 0, 1
Data 43, 0, 1
Data 44, 0, 1
Data 45, 0, 1
Data 46, 0, 1
Data 47, 0, 1
Data 48, 0, 1
Data 49, 0, 1
Data 50, 0, 1
Data 51, 0, 1
Data 52, 0, 1
Data 53, 0, 1
Data 54, 0, 1
Data 55, 0, 1
Data 56, 0, 1
Data 57, 0, 1
Data 58, 0, 1
Data 59, 0, 1
Data 60, 0, 1
Data 61, 0, 1
Data 62, 0, 1
Data 63, 0, 1
Data 64, 0, 1
Data 65, 0, 1
Data 66, 0, 1
Data 67, 0, 1
Data 68, 0, 1
Data 69, 0, 1
Data 70, 0, 1
Data 71, 0, 1
Data 72, 0, 1
Data 73, 0, 1
Data 74, 0, 1
Data 75, 0, 1
Data 76, 0, 1
Data 77, 0, 1
Data 78, 0, 1
Data 79, 0, 1
Data 80, 0, 1
Data 81, 0, 1
Data 82, 0, 1
Data 83, 0, 1
Data 84, 0, 1
Data 85, 0, 1
Data 86, 0, 1
Data 87, 0, 1
Data 88, 0, 1
Data 89, 0, 1
Data 90, 0, 1
Data 91, 0, 1
Data 92, 0, 1
Data 93, 0, 1
Data 94, 0, 1
Data 95, 0, 1
Data 96, 0, 1
Data 97, 0, 1
Data 98, 0, 1
Data 99, 0, 1
Data 100, 0, 1
Data 101, 0, 1
Data 102, 0, 1
Data 103, 0, 1
Data 104, 0, 1
Data 105, 0, 1
Data 106, 0, 1
Data 107, 0, 1
Data 108, 0, 1
Data 109, 0, 1
Data 110, 0, 1
Data 111, 0, 1
Data 112, 0, 1
Data 113, 0, 1
Data 114, 0, 1
Data 115, 0, 1
Data 116, 0, 1
Data 117, 0, 1
Data 118, 0, 1
Data 119, 0, 1
Data 120, 0, 1
Data 121, 0, 1
Data 122, 0, 1
Data 123, 0, 1
Data 124, 0, 1
Data 125, 0, 1
Data 126, 0, 1
Data 127, 0, 1
Data 208, 144, 2: ' А (128)
Data 208, 145, 2: ' Б (129)
Data 208, 146, 2
Data 208, 147, 2
Data 208, 148, 2
Data 208, 149, 2
Data 208, 150, 2
Data 208, 151, 2
Data 208, 152, 2
Data 208, 153, 2
Data 208, 154, 2
Data 208, 155, 2
Data 208, 156, 2
Data 208, 157, 2
Data 208, 158, 2
Data 208, 159, 2
Data 208, 160, 2
Data 208, 161, 2
Data 208, 162, 2
Data 208, 163, 2
Data 208, 164, 2
Data 208, 165, 2
Data 208, 166, 2
Data 208, 167, 2
Data 208, 168, 2
Data 208, 169, 2
Data 208, 170, 2
Data 208, 171, 2
Data 208, 172, 2
Data 208, 173, 2
Data 208, 174, 2
Data 208, 175, 2: ' Я (159)
Data 208, 176, 2: ' а (160)
Data 208, 177, 2
Data 208, 178, 2
Data 208, 179, 2
Data 208, 180, 2
Data 208, 181, 2
Data 208, 182, 2
Data 208, 183, 2
Data 208, 184, 2
Data 208, 185, 2
Data 208, 186, 2
Data 208, 187, 2
Data 208, 188, 2
Data 208, 189, 2
Data 208, 190, 2
Data 208, 191, 2: ' п (175)
Data 209, 176, 2
Data 209, 177, 2
Data 209, 178, 2
Data 209, 179, 2
Data 209, 180, 2
Data 209, 181, 2
Data 209, 182, 2
Data 209, 183, 2
Data 209, 184, 2
Data 209, 185, 2
Data 209, 186, 2
Data 209, 187, 2
Data 209, 188, 2
Data 209, 189, 2
Data 209, 190, 2
Data 209, 191, 2
Data 209, 192, 2
Data 208, 129, 2
Data 208, 130, 2
Data 208, 131, 2
Data 208, 132, 2
Data 208, 133, 2
Data 208, 134, 2
Data 208, 135, 2
Data 208, 136, 2
Data 208, 137, 2
Data 208, 138, 2
Data 208, 139, 2
Data 208, 140, 2
Data 208, 141, 2
Data 208, 142, 2
Data 208, 143, 2
Data 208, 144, 2
Data 208, 145, 2
Data 208, 146, 2
Data 208, 147, 2
Data 208, 148, 2
Data 208, 149, 2
Data 208, 150, 2
Data 208, 151, 2
Data 208, 152, 2
Data 208, 153, 2
Data 208, 154, 2
Data 208, 155, 2
Data 208, 156, 2
Data 208, 157, 2
Data 208, 158, 2
Data 208, 159, 2
Data 209, 128, 2: ' р (224)
Data 209, 129, 2
Data 209, 130, 2
Data 209, 131, 2
Data 209, 132, 2
Data 209, 133, 2
Data 209, 134, 2: ' ц (230)
Data 209, 135, 2: ' ч
Data 209, 136, 2: ' ш
Data 209, 137, 2: ' щ
Data 209, 138, 2: ' ъ
Data 209, 139, 2: ' ы
Data 209, 140, 2: ' ь
Data 209, 141, 2: ' э
Data 209, 142, 2: ' ю (238)
Data 209, 143, 2: ' я (239)
Data 208, 129, 2: ' Ё (240)
Data 209, 145, 2: ' ё (241)
Data 226, 146, 2
Data 226, 147, 2
Data 226, 148, 2
Data 226, 149, 2
Data 226, 150, 2
Data 226, 151, 2
Data 226, 152, 2
Data 226, 153, 2
Data 226, 154, 2
Data 226, 155, 2
Data 226, 156, 2
Data 226, 157, 2
Data 226, 158, 2
Data 226, 159, 2
