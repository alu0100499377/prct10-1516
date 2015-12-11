module Prct07
    
    Node = Struct.new(:value, :next, :anterior)
    
    class Bibliografia
        include Comparable
        attr_accessor :autor, :apellido, :titulo, :isbn, :fecha, :tipo
        
        def initialize(autor, apellido, titulo, isbn, fecha, tipo)
            @autor = autor
            @apellido = apellido
            @titulo = titulo
            @isbn = isbn
            @fecha = fecha
            @tipo = tipo
        end
        
        def to_s
            "Autor: #{@autor}\n Titulo: #{@titulo}\n ISBN: #{@isbn}\n Fecha: #{@fecha}\n"
        end
        
        #def <=>(anOther)
            #titulo.size <=> anOther.titulo.size
        #end
        def <=>(anOther)
            apellido.size <=> anOther.apellido.size
        end
        
    end #class Bibliografia
    #################################################
    
    class List   
        
        include Enumerable
        attr_accessor :cabeza, :tail
        @cabeza = nil
        @tail = nil
        
        def each
            temp = @cabeza
            while (temp != @tail) do
                yield temp.value
                temp = temp.next
            end
        end
        
        def push(nodo)
            if @cabeza == nil
                @cabeza = nodo
                @tail = nodo
            else
                nodo.next = @cabeza
                @cabeza.anterior = nodo
                @cabeza = nodo
                nodo.anterior = nil
            end
        end
        
        def pop()
            if (@cabeza != tail)
                aux = @cabeza
                @cabeza = @cabeza.next
                @cabeza.anterior = nil
                aux.next = nil
                aux.value
            else
                @cabeza = nil
                @tail = nil
            end
        end
        
        def push_final(nodo)
            if @tail == nil
                @tail = nodo
                @cabeza = nodo
            else
                @tail.next = nodo
                nodo.anterior = @tail
                @tail = nodo
            end
        end
        
        def pop_final
            if (@cabeza != @tail)
                aux = @tail
                @tail = @tail.anterior
                @tail.next = nil
                aux.anterior = nil
                aux.value
            else
                @cabeza = nil
                @tail = nil
            end
        end
        
    end #class List
    
    
   class APABibliografia
       
       include Enumerable
       
       attr_accessor :lista
       
       def initialize(lista)
           @lista = lista
       end
        
        def ver(lista)
           @lordenada = Prct07::List.new()
           @lordenada = lista.sort{|a,b| a.apellido <=> b.apellido}
           
           @lordenada.each do |b|
               #puts "LIBROS"
               cadena = "LIBROS\n"
               if b.tipo == 'libro'
                   #puts " #{b.to_s}\n"
                  cadena = cadena+b.to_s+"\n"
               end
            end
            
            @lordenada.each do |b|
               #puts "ARTICULOS"
               cadena = "ARTICULOS\n"
               if b.tipo == 'articulo'
                   #puts " #{b.to_s}\n"
                  cadena = cadena+b.to_s+"\n"
               end
            end
            
            @lordenada.each do |b|
               #puts "OTROS"
               cadena = "OTROS\n"
               if b.tipo != 'libro' and b.tipo != 'articulo'
                   #puts " #{b.to_s}\n"
                   cadena = cadena+b.to_s+"\n"
               end
            end
            cadena
        end
        
   end #end clase APABibliografia
    
    
end #mocule