import es.vuelaconmigo.configuration.SpringConfiguration;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;


public class AppWebInit extends AbstractAnnotationConfigDispatcherServletInitializer {
    @Override
    protected Class<?>[] getRootConfigClasses() {
        return null; // No hay configuración adicional para el contexto raíz
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class[]{SpringConfiguration.class}; // Clase de configuración de Spring MVC
    }

    @Override
    protected String[] getServletMappings() {
        return new String[]{"/"}; // Mapeo del DispatcherServlet a '/'
    }
}
