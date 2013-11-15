veriyap-lar-ruby
================
#{Encoding:UTF-8}
#Stack veri yapısının tanımı
Class Yigin
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
	htmlText= File.open("htmlExam.html","r") do |line|
		linelarım = line.readlines
	end
 
 
	htmlText = htmlText.join().to_s
 
 
	regularExpressıon = /(<.+?>)/ 
	taranmis= htmlText.scan(regularExpressıon)
 
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
	
	print dizi
	 
 
	print("Taglar dengelimi?---> Sonuc:")
	puts(html_denge(filtrele))
 
	
end
 
#Dosyamızdaki tagların dengeli dengesiz olup olmamısını kontrol eder 
def html (taglar)
		i = 0
		t =Kuyruk.new()
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
				t.push(tag)
			else
				if t.Empty? then
					balanced = false
				else
					acik_tag = s.pop()
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
 
def uyumlu(acikTag,kapaliTag)
ac =["<html>","<head>","<title>","<body>","<center>","<hx>","<tr>","<hr>","<p>","<br>”]	
kapa=["</html>","</head>","</title>","</body>","</center>","</hx>","</tr>","</hr>","</p>","</br>”]
	
	return open.index(openTag) == close.index(closeTag)
end
	
def main
 	htmlTarama()
end
 
main if __FILE__ == $PROGRAM_NAME
