
import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_flutter/domain/invoice.dart';

void main() {

  test('Counter value should be incremented', () {

    Invoice iv1 = new Invoice();
    iv1.setId(1);
    iv1.setCustomerId(1);
    iv1.setCreate(DateTime.now());
    iv1.setCode("0101");
    iv1.setBaseAmt(100.0);
    iv1.seTaxAmt(50.0);
    iv1.setTaxPorcentage(16);
    iv1.setTotalAmt(150.0);
    iv1.save();

    Invoice iv2 = new Invoice();
    iv2.setId(2);
    iv2.setCustomerId(1);
    iv2.setCreate(DateTime.now());
    iv2.setCode("0102");
    iv2.setBaseAmt(100.0);
    iv2.seTaxAmt(50.0);
    iv2.setTaxPorcentage(16);
    iv2.setTotalAmt(150.0);
    iv2.save();

    Invoice iv3 = new Invoice();
    iv3.setId(3);
    iv3.setCustomerId(2);
    iv3.setCreate(DateTime.now());
    iv3.setCode("0103");
    iv3.setBaseAmt(100.0);
    iv3.seTaxAmt(50.0);
    iv3.setTaxPorcentage(16);
    iv3.setTotalAmt(150.0);
    iv3.save();

    Invoice iv4 = new Invoice();
    iv4.setId(4);
    iv4.setCustomerId(2);
    iv4.setCreate(DateTime.now());
    iv4.setCode("0104");
    iv4.setBaseAmt(100.0);
    iv4.seTaxAmt(50.0);
    iv4.setTaxPorcentage(16);
    iv4.setTotalAmt(150.0);
    iv4.save();

    Invoice iv5 = new Invoice();
    iv5.setId(5);
    iv5.setCustomerId(3);
    iv5.setCreate(DateTime.now());
    iv5.setCode("0105");
    iv5.setBaseAmt(100.0);
    iv5.seTaxAmt(50.0);
    iv5.setTaxPorcentage(16);
    iv5.setTotalAmt(150.0);
    iv5.save();

    Invoice iv6 = new Invoice();
    iv6.setId(6);
    iv6.setCustomerId(3);
    iv6.setCreate(DateTime.now());
    iv6.setCode("0106");
    iv6.setBaseAmt(100.0);
    iv6.seTaxAmt(50.0);
    iv6.setTaxPorcentage(16);
    iv6.setTotalAmt(150.0);
    iv6.save();

    Invoice iv7 = new Invoice();
    iv7.setId(7);
    iv7.setCustomerId(4);
    iv7.setCreate(DateTime.now());
    iv7.setCode("0107");
    iv7.setBaseAmt(100.0);
    iv7.seTaxAmt(50.0);
    iv7.setTaxPorcentage(16);
    iv7.setTotalAmt(150.0);
    iv7.save();

    Invoice iv8 = new Invoice();
    iv8.setId(8);
    iv8.setCustomerId(4);
    iv8.setCreate(DateTime.now());
    iv8.setCode("0108");
    iv8.setBaseAmt(100.0);
    iv8.seTaxAmt(50.0);
    iv8.setTaxPorcentage(16);
    iv8.setTotalAmt(150.0);
    iv8.save();

    Invoice iv9 = new Invoice();
    iv9.setId(9);
    iv9.setCustomerId(5);
    iv9.setCreate(DateTime.now());
    iv9.setCode("0109");
    iv9.setBaseAmt(100.0);
    iv9.seTaxAmt(50.0);
    iv9.setTaxPorcentage(16);
    iv9.setTotalAmt(150.0);
    iv9.save();

    Invoice iv10 = new Invoice();
    iv10.setId(10);
    iv10.setCustomerId(5);
    iv10.setCreate(DateTime.now());
    iv10.setCode("01010");
    iv10.setBaseAmt(100.0);
    iv10.seTaxAmt(50.0);
    iv10.setTaxPorcentage(16);
    iv10.setTotalAmt(150.0);
    iv10.save();

    Invoice iv11 = new Invoice();
    iv11.setId(11);
    iv11.setCustomerId(6);
    iv11.setCreate(DateTime.now());
    iv11.setCode("01011");
    iv11.setBaseAmt(100.0);
    iv11.seTaxAmt(50.0);
    iv11.setTaxPorcentage(16);
    iv11.setTotalAmt(150.0);
    iv11.save();

    Invoice iv12 = new Invoice();
    iv12.setId(12);
    iv12.setCustomerId(6);
    iv12.setCreate(DateTime.now());
    iv12.setCode("01012");
    iv12.setBaseAmt(100.0);
    iv12.seTaxAmt(50.0);
    iv12.setTaxPorcentage(16);
    iv12.setTotalAmt(150.0);
    iv12.save();

    print("Ejecutando pruebas...");

  });
}