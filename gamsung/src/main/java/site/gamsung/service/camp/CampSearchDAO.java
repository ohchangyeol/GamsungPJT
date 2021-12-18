package site.gamsung.service.camp;

import java.util.List;

import site.gamsung.service.common.Search;
import site.gamsung.service.domain.Camp;

public interface CampSearchDAO {

	public List<Camp> listCamp(Search search) throws Exception;

	public int getTotalCount(Search search) throws Exception;
}
