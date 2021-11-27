/**
 * @description HelloWorldTest
 *
 */
@isTest
public class HelloWorldTest {

    static testMethod void HelloWorldTest() {

        Test.startTest();

        HelloWorld.hello();

        Test.stopTest();

    }

}