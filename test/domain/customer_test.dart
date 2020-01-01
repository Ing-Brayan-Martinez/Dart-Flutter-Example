
import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_flutter/legacy/domain/customer.dart';
import 'package:prueba_flutter/legacy/repository/customer_repository.dart';

void main() {

    test('CustomerTest', () {

        Customer cc1 = new Customer();
        cc1.setId(1);
        cc1.setCode("0101");
        cc1.setName("Epa");
        cc1.setAdress("Valencia, Edo Carabobo");
        cc1.setMail("prueba@gmail.com");
        cc1.setPhone("04142589632");
        cc1.setStatus(1);
        cc1.save();

        Customer cc2 = new Customer();
        cc2.setId(2);
        cc2.setCode("0102");
        cc2.setName("Beco");
        cc2.setAdress("Valencia, Edo Carabobo");
        cc2.setMail("prueba@gmail.com");
        cc2.setPhone("04142589632");
        cc2.setStatus(1);
        cc2.save();

        Customer cc3 = new Customer();
        cc3.setId(3);
        cc3.setCode("0103");
        cc3.setName("Promotora Tántalo");
        cc3.setAdress("Valencia, Edo Carabobo");
        cc3.setMail("prueba@gmail.com");
        cc3.setPhone("04142589632");
        cc3.setStatus(1);
        cc3.save();

        Customer cc4 = new Customer();
        cc4.setId(4);
        cc4.setCode("0104");
        cc4.setName("Sillaca");
        cc4.setAdress("Valencia, Edo Carabobo");
        cc4.setMail("prueba@gmail.com");
        cc4.setPhone("04142589632");
        cc4.setStatus(1);
        cc4.save();

        Customer cc5 = new Customer();
        cc5.setId(5);
        cc5.setCode("0105");
        cc5.setName("Febeca");
        cc5.setAdress("Valencia, Edo Carabobo");
        cc5.setMail("prueba@gmail.com");
        cc5.setPhone("04142589632");
        cc5.setStatus(1);
        cc5.save();

        Customer cc6 = new Customer();
        cc6.setId(6);
        cc6.setCode("0106");
        cc6.setName("Beval");
        cc6.setAdress("Valencia, Edo Carabobo");
        cc6.setMail("prueba@gmail.com");
        cc6.setPhone("04142589632");
        cc6.setStatus(1);
        cc6.save();

        print("Ejecutando pruebas...");
    });

    test("CustomerRepositoryTest", () {
        final CustomerRepository re = new CustomerRepository();

        re.findAll().map((po) => po.toString()).forEach((str) => print(str));

        re.findAllList().then((val) => val.forEach((po) => print(po.toString())));

        re.findById(1).then((val) => val.ifPresent((po) => print(po.toString())));
    });

}
