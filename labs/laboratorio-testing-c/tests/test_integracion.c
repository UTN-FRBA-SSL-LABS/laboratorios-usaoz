#include <stdio.h>
#include "../src/carrito.h"
#include "minunit/minunit.h"

/*
 * Tests de integracion: verifican que las funciones trabajan bien
 * en combinacion, no de forma aislada.
 */

void test_compra_con_descuento(void) {
    printf("\n[compra con descuento]\n");
    Carrito c;
    carrito_init(&c);
    
    Producto pan = {"Pan", 200, 3};
    Producto leche = {"Leche", 350, 2};
    
    carrito_agregar(&c, pan);
    carrito_agregar(&c, leche);
    
    ASSERT_IGUAL(1300, carrito_total(&c));
    ASSERT_IGUAL(1170, carrito_descuento(carrito_total(&c), 10));
}


void test_agregar_hasta_llenar(void) {
    printf("\n[llenar carrito integracion]\n");
    Carrito c;
    carrito_init(&c);
    Producto p = {"Queso", 1500, 1};
    
    carrito_agregar(&c, p);
    carrito_agregar(&c, p);
    carrito_agregar(&c, p);
    carrito_agregar(&c, p);
    
    ASSERT_IGUAL(4, carrito_contar(&c));
    ASSERT_IGUAL(0, carrito_agregar(&c, p));
    ASSERT_IGUAL(4, carrito_contar(&c)); 
}

int main(void) {
    printf("=== Tests de integracion ===");
    test_compra_con_descuento();  
    test_agregar_hasta_llenar();  
    RESUMEN();
    return EXIT_CODE();
}
