require 'spec_helper'
require "lib/prct07/bibliografia.rb"
module Prct07

 describe Prct07::Bibliografia do
  before :each do
    @l = Prct07::Bibliografia.new('Miguel', 'Cervantes', 'El Quijorte', '12345', '1605', 'libro')
    @l2 = Prct07::Bibliografia.new('JRR', 'Tolkien', 'El Hobbit', '5678', '1945', 'libro')
    @l3 = Prct07::Bibliografia.new('JRR', 'Tolkien', 'El Hobbit', '5678', '1945', 'libro')
    
    @node1 = Node.new(@l, nil)
    @node2 = Node.new(@l2, nil)
    
    @node4 = Node.new(@l, nil)
    @node5 = Node.new(@l2, nil)
  end
  
  it 'Debe existir un autor' do
    expect(@l.autor) == 'Cervantes'
  end
  
  it 'Tiene tipo' do
    expect(@l.tipo) == 'libro'
  end
  
  it "Comprobamos que los libros son el mismo" do
    (@l2 == @l3).should eq(true)
  end
  
 end# end describe bibliografia
  
 describe Prct07::List do
  before :each do
    @lista = Prct07::List.new()
    @lista.push(@node1)
    
  end
  it 'Debe existir un Nodo con su valor y su siguiente' do
    expect(@lista.cabeza != nil && @lista.next == nil && @lista.anterior == nil)
  end
  
  it 'Se puede insertar mas de un elemento' do
    @lista.push(@node1)
    @lista.push(@node2)
    expect(@lista.cabeza).to eq(@node2)
  end
  
  it 'Se extrae el primer elemento de la lista' do
    @lista.push(@node1)
    @lista.push(@node2)
    @lista.pop
    expect(@lista.cabeza).to eq(@node1)
  end
  
  it "Lista con su cabeza" do
    @lista2 = Prct07::List.new()
    expect(@lista2.cabeza).to eq(nil)
  end
  
  it "Insertar por el final" do
    @lista.push_final(@node1)
    @lista.push_final(@node2)
    expect(@lista.cabeza).to eq(@node1)
  end
  
  it 'Extraer ultimo elemento de la lista' do
    @lista.push_final(@node4)
    @lista.push_final(@node5)
    @lista.pop_final
    
    expect(@lista.cabeza).to eq(@node4)
  end
  
  it "Se puede hacer each" do
    @lista.each{|i| yield i}
  end
  
    
 end# end describe list
 
 describe Prct07::APABibliografia do
   before :each do
     @b1 = Prct07::Bibliografia.new('Miguel', 'Cervantes', 'El Quijorte', '12345', '1605', 'libro')
     @b2 = Prct07::Bibliografia.new('JRR', 'Tolkien', 'El Hobbit', '12346', '1945', 'narrativa')
     @b3 = Prct07::Bibliografia.new('Risto', 'Mejide', 'Rincon de pensar', '1238', '2015', 'articulo')
     
     @lista = Prct07::List.new()
     
     @nodo1 = Prct07::Node.new(@b1, nil, nil)
     @nodo2 = Prct07::Node.new(@b2, nil, nil)
     @nodo3 = Prct07::Node.new(@b3, nil, nil)
     
     @lista.push(@nodo1)
     @lista.push(@nodo2)
     @lista.push(@nodo3)
     
     @apabibliografia = Prct07::APABibliografia.new(@lista)
    end
    
    context "xpectativas para APABibliografia"
    
      it "Debe ser de la clase APABibliografia" do
        expect(@apabibliografia.class).to eq(APABibliografia)
      end
      
      it "Salida ordenada" do
        expect(ver(@lista)).to eq("LIBRO\nAutor: Miguel\n Titulo: El Quijote\n ISBN: 12345\n Fecha: 1605\n 
                                    ARTICULOS\nAutor: Risto\n Titulo: Rincon de pensar\n ISBN: 1238\n Fecha: 2015\n 
                                    OTROS\nAutor: JRR\n Titulo: El Hobbit\n ISBN: 12346\n Fecha: 1945\n " )
      end
  
  end
 
 
 
end