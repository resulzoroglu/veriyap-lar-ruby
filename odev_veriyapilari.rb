#{Encoding:UTF-8}
#Stack veri yapısının tanımı
class Yigin
	  def initialize
	    @stckdizi =Array.new
	  end
	  
	  def sil
	    return(@stckdizi.pop())		
	  end
	  
	  def ekle(element)
	    @stckdizi.push(element)
	    self
	  end
	  
	  def uzunluk
	    return (@stckdizi.length())
	  end
 
	  def Empty?
	    return @stckdizi == Array.new
	  end
end
 
 
 
 
#dosyamızdaki fonksiyonların filtrelenmesi
def htmlTarama()
	htmlText= File.open("html_taglari.rb","r") do |line|
		linelarim = line.readlines
	end
 
 
	htmlText = htmlText.join().to_s
 
 
	regularExpression = /(<.+?>)/ 
	taranmis= htmlText.scan(regularExpression)
 
	filtrele = []
 
	taranmis.each do |filt|
		filtrele.push(filt)
	end
	
	puts("Dosyadaki html tagları ")
	
	filtrele = filtrele.join(" ").split(" ")
	
	array= []
	filtrele.each do |eleman|
	    if eleman.match(/<[^\/]+?>/) then
	       array.push(eleman)
	     end
	end
	
	print filtrele
	
	
	puts("HTML dosyasındaki taglar: ")
	
	print array
	 
 
	print("Html dosyamizdaki taglar degelimi Result:")
	puts(html_denge(filtrele))
 
	
end
 
#Dosyamızdaki tagların dengeli dengesiz olup olmamısını kontrol eder 
def html_denge (taglar)
		i = 0
		t =Yigin.new()
		balanced = true
		
		array = []
		taglar.each do |eleman|
		    if eleman.match(/<[^\/]+?>/) then
		       array.push(eleman)
		     end
		end
	
		while (i < taglar.length() and balanced == true) do
			tag = taglar[i]
			
			
			if array.include?(tag) then
				t.ekle(tag)
			else
				if t.Empty? then
					balanced = false
				else
					acik_tag = t.sil()
					if not uyumlu(acik_tag,tag) then
						balanced = false
					end	
				end
			end
			i = i + 1
		end
			
		if balanced and t.Empty? then
			return true
 
		else
			return false
 
		end
end
 
def uyumlu(openTag,closeTag)
open =["<html>","<head>","<title>","<body>","<center>","<hx>","<b>","<hr>","<p>","<pre","<dl>","<dt>","<ul>","<ol>","<br>"]
close =["</html>","</head>","</title>","</body>","</center>","</hx>","</b>","</hr>","</p>","</pre","</dl>","</dt>","</ul>","</ol>","</br>"]
return open.index(openTag) == close.index(closeTag)
end
	
def main
 	htmlTarama()
end

main if __FILE__ == $PROGRAM_NAME
