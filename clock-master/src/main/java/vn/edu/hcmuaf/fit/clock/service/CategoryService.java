package vn.edu.hcmuaf.fit.clock.service;

import vn.edu.hcmuaf.fit.clock.dao.admin.CategoryDao;
import vn.edu.hcmuaf.fit.clock.model.Category;

import java.util.List;


public class CategoryService {
    CategoryDao categoryDao = new CategoryDao();

    public List<Category> getAllCategory() {
        return categoryDao.getAllCategory();
    }

    public void addCategory(String categoryName) {
        if (categoryName == null || categoryName.trim().isEmpty()) {
            throw new IllegalArgumentException("Tên danh mục không được trống");
        }
        categoryDao.addCategory(categoryName);
    }

    public void updateCategory(int id, String name) {
        if (id <= 0) {
            throw new IllegalArgumentException("Invalid category ID!");
        }
        if (name == null || name.trim().isEmpty()) {
            throw new IllegalArgumentException("Category name cannot be empty!");
        }
        categoryDao.updateCategory(id, name);
    }

    public void deleteCategory(int id) {
        if (id <= 0) {
            throw new IllegalArgumentException("Invalid category ID!");
        }
        categoryDao.deleteCategory(id);
    }

    public Category findCategoryById(int id) {
        if (id <= 0) {
            throw new IllegalArgumentException("Invalid category ID!");
        }
        return categoryDao.findCategoryById(id);
    }

    public boolean isCategoryExists(int id) {
        return findCategoryById(id) != null;
    }

    public List<Category> findCategoryByName(String keyword) {
        return categoryDao.findCategoryByName(keyword);
    }

}
