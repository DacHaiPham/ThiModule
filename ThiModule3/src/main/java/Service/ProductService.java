package Service;

import Model.Product;
import Repository.ProductRepository;

import java.util.List;

public class ProductService {
    private ProductRepository productRepository = new ProductRepository();

    public boolean addProduct(Product product) {
        productRepository.addProduct(product);
        return false;
    }

    public List<Product> getAllProducts() {
        return productRepository.getAllProducts();
    }

    // Hàm xóa sản phẩm theo ID
    public boolean hideProduct(int id) {
        return productRepository.hideProduct(id);
    }
}


//    public List<Product> getProductById(int id) {
//        return productRepository.getProductById();
//    }
