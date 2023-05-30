package p2.test;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;

import p2.AccesoBD;
import p2.ProductoBD;
import p2.UsuarioBD;

class AccesoBDTest {

	@Test
	void testGetInstance() {
		AccesoBD res = AccesoBD.getInstance();
		assertNotNull(res);
	}

	@Test
	void testComprobarAcceso() {
		AccesoBD res = AccesoBD.getInstance();
		assertNotNull(res);
		boolean res2 = res.comprobarAcceso();
		assertTrue(res2);
	}
	
	@Test
	void testObtenerProductosBD() {
		AccesoBD res = AccesoBD.getInstance();
		assertNotNull(res);
		List<ProductoBD> productos = res.obtenerProductosBD();
		assertTrue(productos.size()>0);
	}
	
	@Test
	void testObtenerProductoBDPorId() {
		AccesoBD acceso = AccesoBD.getInstance();
		
		ProductoBD prod = acceso.obtenerProductoBDPorId(1);
		
		assertNotNull(prod);
		
		assertTrue(prod.getCodigo()==1);
		
		prod = acceso.obtenerProductoBDPorId(10000);
		
		assertNull(prod);
	}
	
	@Test
	void testComprobarUsuarioBD() {
		AccesoBD acceso = AccesoBD.getInstance();
		int u = acceso.comprobarUsuarioBD("r.penya", "rpenya");
		assertEquals(2, u);
	}
	
	@Test
	void testRegistraUsuarioBD() {
		AccesoBD acceso = AccesoBD.getInstance();
		
		boolean user = acceso.registraUsuarioBD("r.penya", "rpenya", "raul peña", 666555444, "calle ...");
		
		assertTrue(user);
		
	}


}
