**Work**

4 Bit Johnson Counter Example with VHDL language.


**Usage**


The codes are written in Windows XP operating system at Xilink ISE. Please run johnsoncounter.ise with Xilink.



**Code**

![VHDL Module Johnson Counter Code](/images/johnsoncounter-vhdl-module.jpg)


Clock ve Reset olmak üzere iki input bulunmakta. Output olarak ise 0 downto 3 şeklinde 4 tane outpu tanımladık bunu Syntesis Report ta göreceğiz. Process i clk ve reset parametreleri ile başlatıyoruz. Eğer Reset "1" ise outputlarımız "0000" değerine getiriliyor. Çünkü bu bir 4 bitlik Johson Counteri. Eğer Reset "0" ise ve Test Branch'te göreceğimiz Clock değeri, her bir saat vuruşunda aşağıdaki işlemi gerçekleştirecek; 
 En sağdaki biti bir sola kaydır.
 En soldaki biti en sağa değili olarak getir. ( Bu case için 0 olmalıdır.) Bu durumda Counter Binary şekilde 0000 dan 1111' daha sonra ise 1111'den 0000 a geriye doğru sayacaktır.



**Syntesis Report**

![Syntesis Report Johnson Counter](/images/syntesis-report.jpg)

Codu yazıp compile ettik sonrasında ise Syntesis Report Sayfası karşımıza geliyor. Burada inputları ve Vector şeklinde tanımlanmış outputları görmekteyiz. Sizi şaşırtmasın inputlarımız 0 gözüksede Clock inputu GCK (Global Clock) Reset inputu GSR (Global Set/Reset) olarak tanımlandı.

**RTL Schematic**

![Main RTL Schematic Johnson Counter](/images/rtl-schematic0.jpg)

Burada çok basitçe devrenin ana yapısını görmekteyiz.

![RTL Schematic Johnson Counter](/images/rtl-schematic.jpg)

Burada ise Outputun sadece vektor olarak açılımı görünmekte. Ama Q çıkışından anlayacağımız üzere 4 adet D tipi Flip/Flop var. Çünkü Bir D tipi bir Flip/Flop aynı saat vuruşunda sadece bir bitlik bilgi tutabilir.


**Technology Schematic**

![Main Technology Schematic Johnson Counter](/images/technology-schematic0.jpg)


Burada çok basitçe devrenin ana yapısını görmekteyiz.

![Technology Schematic Johnson Counter](/images/technology-schematic.jpg)


Burada ise devre tamamen açık bir şekilde görünmekte. Son FF'in çıkışının Invertor olmasına dikkat etmek gerek. Çünkü Sayacımız geriyede saymalı.


**Testing**

![Test Branch Johnson Counter Code](/images/tbjohnsoncode0.jpg)


Görüldüğü gibi Clock Reset ve Q outputumuzu vektör şeklinde bir component olarak tanımladık. Inputlarımızın başlangıç değerlerini "0" olarak initilaze ettik.
Process başladığında görüldüğü üzere Clock değerinin değeri fark etmeksizin periyot/2 kadar clock değeri bekleyecek. Clock Periyot değeri bu örnek için 10 ns olarak initilaze edildi. Bu karesel sinyallerin önemli bir şifreleme tekniğidir. Tabiki başka tekniklerde vardır fakat bu örnek için Periyot/2 zaman 0 Periyot/2 zaman 1 değeri olarak tanımlanır. Veya tam tersi ilk 1 sonra 0 olarak. 


![Test Branch Johnson Counter Code](/images/tbjohnsoncode.jpg)

Reset ise bu örnekte ilk 100 ns bekleyecek daha sonraki 100 ns için çalışacaktır.


![Test Branch Johnson Counter Simulation](/images/tbjohnson1.jpg)

Görüldüğü üzere test başladığında her bir clock periyodu boyunca sayma işlemimiz gerçekleşiyor tabiki bu sayma binary biçimde 0000, 0001, 0011, 0111, 1111 şeklinde ilerliyor. 100. ns yede reset 0 dan 1 e geçme durumunda ise sayaç tamamen sıfırlanıyor "0000". Reset süresi boyunca sayaç "0000" değerini göstermektedir. 200. ns'de reset bitiyor. ve 205. ns' clock vuruşunun başlamasıyla  ("0" dan "1" değerine geçmesiyle) beraber sayaç tekrar saymaya başlıyor.

![Test Branch Johnson Counter Simulation](/images/tbjohnson2.jpg)

Daha yakın ve ayrıntılı bir şekilde dönen değerleri binary biçimde görebiliyoruz.

![Test Branch Johnson Counter Simulation](/images/tbjohnson3.jpg)

Bu devrenin sonsuza kadar 0000 dan 1111'e 1111'den 0000'a (reset dolayısıyla 100. ve 200. ns ler haricinde) sonsuza kadar sayacağını söyleyebiliriz. Başka bir testcase'de reset değerini değiştirerek başka sonuçlar tabikide elde edebiliriz fakat Sayacın sayma işlemi değişmeyecektir.


4 bitlik Johnson Counteri ile ilgili örnek bir senaryoyu incelemiş olduk. Aynı mantık ile Bit sayısına göre Johnson Counteri varyantı elde edilebilir.