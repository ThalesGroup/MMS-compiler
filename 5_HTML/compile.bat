@echo equ 2>/dev/null ; if false ; then # 2>NUL >NUL & goto WIN & rem ^
rept 0 { ; fi ; ../bin/fasm compile.bat 5.mms ; exit $? #
:WIN
@echo off & ..\bin\FASM.EXE compile.bat 5.mms & pause & exit }

; WAP230 long int encoder
macro w230ii fsize {
   if fsize >= 80h
      if fsize < 4000h
         db 80h or (fsize shr 7)
      else
         if fsize < 200000h
            db 80h or (fsize shr 14), 80h or ((fsize shr 7) and 7Fh)
         else
            db 80h or (fsize shr 21), 80h or ((fsize shr 14) and 7Fh), 80h or ((fsize shr 7) and 7Fh)
         end if
      end if
   end if
   db fsize and 7Fh
}

; WAP230 short int encoder
macro w230ll fsize {
   if fsize >= 1Fh
      db 1Fh
   end if
   db fsize
}

   virtual at 0
      file 'include\subject.txt'
      subjsize = $
   end virtual
   virtual at 0
      file 'include\body.htm'
      textsize = $
   end virtual

; MMS file
org 0

   db 8Ch,84h ; message type = m_retrieve_conf
   db 98h     ; X-Mms-Transaction-ID: 'AXY'
   db 41h + %t mod 25,41h + subjsize mod 25,41h + textsize mod 25,00h
   db 8Dh,90h ; X-Mms-MMS-Version: 1.0

   ; Date (must be present for compatibility with Android MMS Client)
   db 85h
   curtime = %t - 43200
   db 04h,curtime shr 24,(curtime shr 16) and 0FFh,(curtime shr 8) and 0FFh,curtime and 0FFh

   ; From
   db 89h
   w230ll l1size
l1 db 80h
   file 'include\from.txt'
   db '/TYPE=PLMN',0
l1size = $ - l1

   ; Subject
   if subjsize > 0
      db 96h
      file 'include\subject.txt'
      db 0
   end if

   db 84h ; Content-Type
   db 1Fh,20h ; length (must be >1F for compat with Nokia Multimedia Player)
   db 0B3h ; application/vnd.wap.multipart.related
   db 89h ; Multipart Related Type
   db 'application/smil',0
   db 8Ah ; Presentation Content ID
   db '<smil.smil>',0

   db 02h ; Number of contents = 2: h.htm, smil.smil
   db 0Bh ; length - data_length
   w230ii textsize
   db 03h ; Content-Type length
   db 82h,81h,0EAh ; utf-8
   db 8Eh,'h.htm',0
   file 'include\body.htm'

   db 1Fh ; length - data_length
   w230ii smilsize
   db 13h ; Content-Type length
   db 'application/smil',0
   db 81h,83h ; Charset: us-ascii
   db 8Eh,'smil.smil',0
smil:
   db '<smil>'
   db   '<head>'
   db     '<layout>'
   db       '<root-layout/>' ; mandatory for compatibility with Nokia Multimedia Player
   db       '<region id="Text" width="100%" height="100%"/>'
   db     '</layout>'
   db   '</head>'
   db   '<body>'
   db     '<par dur="60s">'
   db       '<text src="h.htm" region="Text"/>'
   db     '</par>'
   db   '</body>'
   db '</smil>'
smilsize = $ - smil
