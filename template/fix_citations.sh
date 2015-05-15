#!/bin/bash -norc

#
# to use put 'BIBTEX=template/trim_citations.sh $(NAME)' in your Makefile
#

template/rbibtex $1
sed 's/ USENIX Association\.//' < $1.bbl | \
sed '/\. USENIX/{N;s/USENIX[\n]*[ ]*Association\.//}' | \
sed 's/\. ACM\.//;s/\. IEEE\.//' | \
sed '/\. ACM/{N;s/ACM[\n]*[ ]*SIGOPS\.//}' | \
sed '/\. ACM/{N;s/ACM[\n]*[ ]*Press[,\.]//}' | \
sed '/\. Association/{N;s/Association[\n]*[ ]*for Computing Machinery SIGOPS\.//}' | \
sed '/\. IEEE/{N;s/IEEE[\n]*[ ]*Computer Society\.//}' | \
sed 's/\.sourceforge\.net/\.sf\.net/g' | \
sed 's/\ pages/\ pp./g' | \
sed '/\ [0-9][0-9][0-9][0-9])/{N;s/\ ([A-Z][A-Z]*[\n]*[ ]*[0-9][0-9][0-9][0-9])//}' | \
sed '/\ .[0-9][0-9])/{N;s/\ ([A-Z][A-Z]*[\n]*[ ]*.[0-9][0-9])//}' | \
sed 's/Proceedings/Proc\./g' | \
sed 's/First/1st/g' | \
sed 's/Second/2nd/g' | \
sed 's/Third/3rd/g' | \
sed 's/Fourth/4th/g' | \
sed 's/Fifth/5th/g' | \
sed 's/Sixth/6th/g' | \
sed 's/Seventh/7th/g' | \
sed 's/Eighth/8th/g' | \
sed 's/Ninth/9th/g' | \
sed 's/Tenth/10th/g' | \
sed '/^\\newblock (/d' > /tmp/$$.bbl.tmp
mv /tmp/$$.bbl.tmp $1.bbl
