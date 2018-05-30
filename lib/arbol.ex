defmodule Arbol do

  defstruct [:izq, :der, :val]

  def nuevo(valor) do
    agregar(nil, valor)
  end

  def agregar(_, valor) when is_nil(valor) do
    IO.puts "Valor no ha sido dado"
  end

  def agregar(arbol, valor) do
    if is_nil(arbol) do
      %Arbol{val: valor}
    else
      %Arbol{izq: izq, der: der, val: val} = arbol
      IO.puts "valor: #{val==nil}"
      if val == nil do
        %Arbol{val: valor}
      else
        if valor >= val do
          # Es mayor o igual
          %Arbol{izq: izq, der: agregar(der,valor), val: val}
        else
          # Es menor o igual
          %Arbol{izq: agregar(izq,valor), der: der, val: val}
        end
      end
    end
  end

  def cantidadNodos(arbol) do
    if is_nil(arbol) do
      0
    else
      %Arbol{izq: izq, der: der} = arbol
      1 + cantidadNodos(izq) + cantidadNodos(der)
    end
  end
end
