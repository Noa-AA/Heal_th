package unhak.dao.face;

import java.util.List;

import unhak.dto.CartDto;
import unhak.dto.PaymentDto;

public interface OrderlistDao {

	/*주문 목록*/
	public List<PaymentDto> getOrder(int userNo);

}
