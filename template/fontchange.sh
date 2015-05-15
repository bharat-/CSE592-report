  # We go for replacing the wrong commercial font names with URW names, we also
  # adapt some similar fonts names on the fly (extend for further font names):

  cat $1.ps | sed 's+Times-Bold+NimbusSanL-Bold+g' |\
   sed 's+Times-Roman+NimbusSanL-Regu+g' |\
   sed 's+Times+NimbusSanL-Regu+g' |\
   sed 's+Helvetica-BoldOblique+NimbusSanL-BoldItal+g' |\
   sed 's+Helvetica-Oblique+NimbusSanL-ReguItal+g' |\
   sed 's+Helvetica-Bold+NimbusSanL-Bold+g' |\
   sed 's+Helvetica-Bold-iso+NimbusSanL-Bold+g' |\
   sed 's+Helvetica+NimbusSanL-Regu+g' |\
   sed 's+Helvetica-iso+NimbusSanL-Regu+g' |\
   sed 's+Symbol+StandardSymL+g' > $1-new.ps
