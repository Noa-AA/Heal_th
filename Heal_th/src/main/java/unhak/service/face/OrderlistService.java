package unhak.service.face;

import java.util.List;

import unhak.dto.CartDto;
import unhak.dto.PaymentDto;

public interface OrderlistService {

	public List<PaymentDto> getOrderList(int userNo);

}
