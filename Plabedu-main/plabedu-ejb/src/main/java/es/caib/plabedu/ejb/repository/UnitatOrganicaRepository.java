package es.caib.plabedu.ejb.repository;

import es.caib.plabedu.persistence.model.UnitatOrganica;
import es.caib.plabedu.service.model.AtributUnitat;
import es.caib.plabedu.service.model.Ordre;
import es.caib.plabedu.service.model.UnitatOrganicaDTO;

import java.util.List;
import java.util.Map;
import java.util.Optional;

/**
 * Interfície de les operacions bàsiques sobre Unitats Orgàniques.
 * Són les generals per CRUD més les específiques per procediments.
 *
 * @author areus
 */
public interface UnitatOrganicaRepository extends CrudRepository<UnitatOrganica, Long> {

    Optional<UnitatOrganica> findByCodiDir3(String codiDir3);

    List<UnitatOrganicaDTO> findPagedByFilterAndOrder(int firstResult, int maxResult,
                                                      Map<AtributUnitat, Object> filter,
                                                      List<Ordre<AtributUnitat>> ordenacio);

    long countByFilter(Map<AtributUnitat, Object> filter);

}
