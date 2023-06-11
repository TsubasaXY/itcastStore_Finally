package test;

import com.itcast.itcaststore.domain.*;
import com.itcast.itcaststore.mapper.OrderItemMapper;
import com.itcast.itcaststore.mapper.ProductMapper;
import com.itcast.itcaststore.mapper.UserMapper;
import com.itcast.itcaststore.service.*;
;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.mail.MessagingException;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:ApplicationContext.xml")
public class SpringTest {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private IUserService userService;
    @Autowired
    private INoticeService noticeService;
    @Autowired
    private ProductService productService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private OrderItemService orderItemService;
    @Autowired
    private OrderItemMapper orderItemMapper;
    @Test
    public void springTest() {
        boolean qhdlxc = userMapper.queryByName("qhdlxc");
        System.out.println(qhdlxc);

//        User admin = userService.findUserbyName("qhdlxc");
//        System.out.println(admin);
    }

    @Test
    public void testAdduser() {
        userMapper.activeUser("680d6645-f6d0-11ed-8943-84a9387fe130");
//        User userByActiveCode = userMapper.findUserByActiveCode("dc32ae81-f6cf-11ed-8943-84a9387fe130");
//        System.out.println(userByActiveCode);
//        userMapper.activeUser("dc32ae81-f6cf-11ed-8943-84a9387fe130");
//        User userbyName = mapper.findUserbyName("Tsubasa");
//        System.out.println(userbyName);
//        User user = new User();
//        user.setUsername("0425");
//        user.setPassword("12345615120");
//        user.setGender("男");
//        user.setEmail("13256@qq.com");
//        user.setTelephone("12345412");
//        user.setIntroduce("你好我是0425");

//        user.setState(1);
//        userService.AddUser(user);
//        userService.activeUser("a5b0991a-e37f-11ed-bc6b-84a9387fe130");
//        User userByActiveCode = userService.findUserByActiveCode("a5b0991a-e37f-11ed-bc6b-84a9387fe130");
//        System.out.println(userByActiveCode);
//        User user = userService.findUserByUsernameAndPassword("Tsubasa", "admin");
//        List<User> admin = userService.queryByName("admin");
//        System.out.println(admin);
    }

    @Test
    public void testNotice() {
//        for (Notice allNotice : noticeService.getAllNotices()) {
//            System.out.println(allNotice);
//        }
//        Notice notice = new Notice();
//        notice.setN_id(5);
//        notice.setTitle("测试标题2");
//        notice.setDetails("测试内容2");
//        notice.setN_time("20230422");
//        noticeService.addNotice(notice);
//        Notice notice = noticeService.findNoticeById("2");
//        System.out.println(notice);

//        noticeService.updateNotice(notice);
//        noticeService.deleteNotice("5");
        Notice recentNotice = noticeService.getRecentNotice();
        System.out.println(recentNotice);
    }

    @Test
    public void testProduct() {
//        PageBean bean = productService.findProductByPage(1, 3, "计算机");
//
//        List<Product> ps = bean.getPs();
//        for (Product product:ps){
//            System.out.println(product);
//        }

//        List<OrderItem> orderItems = new ArrayList<>();
//        OrderItem orderItem = new OrderItem();
//        orderItem.setBuynum(10);
//        Product product = new Product();
//        product.setId("cb22386f-0b77-454c-976f-d6417ad72613");
//        orderItem.setP(product);
//        orderItems.add(orderItem);
//        OrderItem orderItem1 = new OrderItem();
//        orderItem1.setBuynum(10);
//        Product product1 = new Product();
//        product1.setId("c85d68d3-5758-494e-8dcf-f4f84d852949");
//        orderItem1.setP(product1);
//        orderItems.add(orderItem1);
//        productService.updateProductNum(orderItems);
//        productService.deleteProduct("1");
//        int bookByNameAllCount = productService.findBookByNameAllCount("老");
//        System.out.println(bookByNameAllCount);
//        List<OrderItem> items = new ArrayList<>();
//        Product product1 = new Product();
//        product1.setId("068a3247-b659-4764-a3c7-c98badd5f0ed");
//        OrderItem item1 = new OrderItem();
//        item1.setP(product1);
//        item1.setBuynum(3);
//        items.add(item1);
//
//        Product product2 = new Product();
//        product2.setId("26ddd0c6-d7f2-4a83-b01b-286bb8c38420");
//        OrderItem item2 = new OrderItem();
//        item2.setP(product2);
//        item2.setBuynum(3);
//        items.add(item2);
//
//        productService.updateProductNum(items);//有问题


//        List<OrderItem> items1 = new ArrayList<>();
//        Product product1 = new Product();
//        product1.setId("068a3247-b659-4764-a3c7-c98badd5f0ed");
//        OrderItem item1 = new OrderItem();
//        item1.setBuynum(2);
//        item1.setP(product1);
//        items1.add(item1);
//        productService.updateProductNum(items1);

//        PageBean pageBean = productService.findBookByName(1, 10, "java");
//        for (Product product : pageBean.getPs()) {
//            System.out.println(product);
//        }
//        List<WeekHotProduct> weekHotProduct = productService.getWeekHotProduct();
//        System.out.println(weekHotProduct);
//        List<OrderItem> items1 = new ArrayList<>();
//        Product product1 = new Product();
//        product1.setId("068a3247-b659-4764-a3c7-c98badd5f0ed");
//        OrderItem item1 = new OrderItem();
//        item1.setBuynum(2);
//        item1.setP(product1);
//        items1.add(item1);
//
//        Product product2 = new Product();
//        product2.setId("26ddd0c6-d7f2-4a83-b01b-286bb8c38420");
//        OrderItem item2 = new OrderItem();
//        item2.setBuynum(2);
//        item2.setP(product2);
//        items1.add(item2);
//        productService.updateProductNum(items1);
//        Product product = new Product();
//        product.setId("cb22386f-0b77-454c-976f-d6417ad72613");
//        product.setName("中国国家地理");
//        product.setPrice(19);
//        product.setPnum(497);
//        product.setCategory("地理");
//        product.setImgurl("/productImg/2/0/2105fbe5-400f-4193-a7db-d7ebac389550.jpg1");
//        product.setDescription("《中国国家地理》，原名《地理知识》，是关于地理的月刊，该刊的文章和图片经常被中央及地方媒体转载。具有很强的可读性和收藏价值，国内外很多家图书馆已经把该刊作为重点收藏期刊。内容以中国地理为主，兼具世界各地不同区域的自然、人文景观和事件，并揭示其背景和奥秘，另亦涉及天文、生物、历史和考古等领域。是中国大陆著名的有关地理的杂志。因该社隶属中国科学院，有一大批自然地理和人文地理的专家学者作为该社顾问，同时还有许多战斗在科考第一线的工作者与杂志社保持着密切联系，因此具有很强的独家性和权威性。1");
//        productService.editProduct(product);

//        List<Product> condition = productService.findProductByManyCondition("", "记","" , "30","" );
//        System.out.println(condition);
//        Product product = productService.findProductById("");
//        System.out.println(product);
//        Product product = new Product();
//        UUID uuid = UUID.randomUUID();
//        String string = uuid.toString();
//        product.setId(string);
//        product.setCategory("小说");
//        product.setDescription("213");
//        product.setName("老人与海");
//        product.setPnum(50);
//        product.setPrice(13);
//        product.setImgurl("imgurl");
//        productService.addProduct(product);
//        List<Product> page = productService.findProductByPage(1,5,"计算机");
//        for (Product product:page){
//            System.out.println(product);
//        }
//        Product product = productService.findProductById("26ddd0c6-d7f2-4a83-b01b-286bb8c38420");
//        System.out.println(product);
//        List<Product> page = productService.findByPage("计算机", 2, 10);
//        for (Product product:page){
//            System.out.println(product);
//        }

//        System.out.println(page);
//        List<SaleTop> saleTops = productService.salesList("2022","06");
//        for (SaleTop saleTop:saleTops){
//            System.out.println(saleTop);
//        }
//        int count = productService.findAllCount("原版");
//        System.out.println(count);
//        List<Product> products = productService.listAll();
//        for (Product product:products){
//            System.out.println(product);
//        }
    }
    @Test
    public void testOrder(){

//        Order order = new Order();
//        List<Product> products=new ArrayList<>();
//        order.setId("f6f916e9-e105-4d19-8d39-11d22e5d4a9d");
//
        Order orderById = orderService.findOrderById("f6f916e9-e105-4d19-8d39-11d22e5d4a9d");
        System.out.println(orderById);
//        List<Map<String, Object>> orderItemByOrder = orderItemMapper.findOrderItemByOrder(order.getId());
//        for (Map<String, Object> stringObjectMap : orderItemByOrder) {
//            Product product = productMapper.findProductById((String) stringObjectMap.get("product_id"));
//            products.add(product);

//            productMapper.findProductById("")
//        }
//        System.out.println();
        
//        Map<String, Object> orderItemByOrder = orderItemMapper.findOrderItemByOrder(order.getId());
//        System.out.println(orderItemByOrder);
//        User user = new User();
//        user.setId(2);
//        Order order = new Order();
//        order.setUser(user);
//        order.setId("13");
//        order.setMoney(2);
//
//        order.setReceiverAddress("x3j");
//        order.setReceiverName("g3y");
//        order.setReceiverPhone("1389");
//
//        orderService.addOrder(order);
//        orderService.delOrderByid("35e35e10-c135-4318-991b-fef63300a842");
//        for (Order order : orderService.findOrderByManyCondition("a784919f-6001-4d88-a034-0545edfba39b", "")) {
//            System.out.println(order);
//        }

//        orderService.updateOrderState("305a7870-3820-4079-b6f9-5d2b63cbcd2a");
//        Order orderById = orderService.findOrderById("03aad015-fa50-4151-b5b0-54c351a2fa77");
//        System.out.println(orderById);
//        User user = new User();
//        user.setId(2);
//        List<Order> orderByUser = orderService.findOrderByUser(user);
//      for(Order order:orderByUser) {
//          System.out.println(order);
//      }



//        Order order = orderService.findOrderById("0f4b375e-fcb0-4ee2-96a0-813ddb01ef39");
//        for (OrderItem orderItem : orderItemService.findOrderItemByOrder(order)) {
//            System.out.println(orderItem);
//        }

//        for(OrderItem orderItem:orderById.getOrderItems()){
//            System.out.println(orderItem);
//        }
//        System.out.println(orderById);
//        Order order = new Order();
//        User user = new User();
//        user.setId(2);
//
//
//        order.setId(IdUtils.getUUID());
//        List<OrderItem> items1 = new ArrayList<>();
//        Product product1 = new Product();
//        product1.setId("068a3247-b659-4764-a3c7-c98badd5f0ed");
//        OrderItem item1 = new OrderItem();
//        item1.setBuynum(2);
//        item1.setP(product1);
//        items1.add(item1);
//
//        Product product2 = new Product();
//        product2.setId("26ddd0c6-d7f2-4a83-b01b-286bb8c38420");
//        OrderItem item2 = new OrderItem();
//        item2.setBuynum(2);
//        item2.setP(product2);
//        items1.add(item2);
//        order.setOrderItems(items1);
//        order.setPaystate(1);
//        order.setUser(user);
//        order.setReceiverAddress("20230504");
//        order.setReceiverName("Tsubasa1");
//        orderService.addProduct(order,user);

//        for (Order order : orderService.findAllOrder()) {
//            System.out.println(order);
//        }

    }
//    @Test
//    public void testOrderItem(){
//        Order orderById = orderService.findOrderById("03aad015-fa50-4151-b5b0-54c351a2fa77");
//        List<OrderItem> byOrder = orderItemService.findOrderItemByOrder(orderById);
//        System.out.println("order"+orderById);
//        for (OrderItem orderItem:byOrder)
//        System.out.println("orderitem"+orderItem);
//        Order order = new Order();
//        order.setId("03aad015-fa50-4151-b5b0-54c351a2fa77");
//        for (OrderItem orderItem : orderItemService.findOrderItemByOrder(order)) {
//            System.out.println(orderItem);
//        }
//
//        Order order1 = new Order();
//        User user = new User();
//        user.setId(2);
//        order1.setReceiverPhone("12345678910");
//        order1.setReceiverName("Tsubasa");
//        order1.setUser(user);
//        OrderItem orderItem1 = new OrderItem();
//        order1.setId("0clds57s-fa50-4151-b5b0-54c351a2fa77");
//        Product product = new Product();
//        product.setId("068a3247-b659-4764-a3c7-c98badd5f0ed");
//        Product product1 = new Product();
//        product1.setId("67a44950-935a-4dac-953d-515fd92d8174");
//        orderItem1.setBuynum(100);
//        orderItem1.setP(product1);
////        orderItemService.addOrderItem(order1);
//        orderService.addOrder(order1);
//orderItemService.delOrderItems("03aad015-fa50-4151-b5b0-54c351a2fa77");

//    }
@Test
public  void test() throws MessagingException {
    PageBean bean = productService.findProductByPage(1, 4, "j");
    for (Product p : bean.getPs()) {
        System.out.println(p);
    }


//    System.out.println(bookByName);
//    sendMail("1931091105@qq.com","hello");
//    productMapper.
    }

}
