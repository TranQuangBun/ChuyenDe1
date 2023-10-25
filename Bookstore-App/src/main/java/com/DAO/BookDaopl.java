package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDtls;

public class BookDaopl implements BookDAO {

	private Connection conn;

	public BookDaopl(Connection conn) {
		super();
		this.conn = conn;
	}

	// Add Book

	public boolean addBooks(BookDtls b) {

		boolean f = false;

		try {
			String sql = "insert into book_dtls(bookname,author,price,bookCategory,status,photo,user_email)values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getBookCategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhoto());
			ps.setString(7, b.getUseremail());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

//	Show all book
	public List<BookDtls> getAllBooks() {

		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;

		try {
			String sql = "select * from book_dtls";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUseremail(rs.getString(8));
				list.add(b);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;
	}

//	Get Book with Id
	public BookDtls getBookById(int id) {

		BookDtls b = null;
		try {
			String sql = "select *from book_dtls where bookID = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUseremail(rs.getString(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}

//	Edit Book 
	public boolean updateEditBooks(BookDtls b) {

		boolean f = false;
		try {
			String sql = "update book_dtls set bookname=?, author=?,price = ?,status=? where bookID=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getBookId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

//	Delete Book
	public boolean deleteBooks(int id) {
		boolean f = false;
		try {
			String sql = "delete from book_dtls where bookID=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

// Show new book
	public List<BookDtls> getNewBook() {

		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {

			String sql = "select *from book_dtls where bookCategory =? and status=? order by bookID DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New Book");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i<=4) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUseremail(rs.getString(8));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// Show recent book

	public List<BookDtls> getRecentBook() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {

			String sql = "select *from book_dtls where status=? order by bookID DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i<=4) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUseremail(rs.getString(8));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// Show old book
	public List<BookDtls> getOldBook() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {

			String sql = "select *from book_dtls where bookCategory =? and status=? order by bookID DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old Book");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();

			int i = 1;
			while (rs.next() && i<=4) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUseremail(rs.getString(8));
				list.add(b);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

//	Gett All New/Old/Recent Book

	@Override
	public List<BookDtls> getAllRecentBook() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {

			String sql = "select *from book_dtls where status=? order by bookID DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUseremail(rs.getString(8));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getAllNewBook() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {

			String sql = "select *from book_dtls where bookCategory =? and status=? order by bookID DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New Book");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUseremail(rs.getString(8));
				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getAllOldBook() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null;
		try {

			String sql = "select *from book_dtls where bookCategory =? and status=? order by bookID DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old Book");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUseremail(rs.getString(8));
				list.add(b);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getBookByOld(String email, String cate) {
	
		List<BookDtls> list= new ArrayList<BookDtls>();
	 BookDtls b = null;
	 try {
		String sql="select * from book_dtls where bookCategory=? and user_email=? ";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, cate);
		ps.setString(2, email);
		
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			b = new BookDtls();
			b.setBookId(rs.getInt(1));
			b.setBookname(rs.getString(2));
			b.setAuthor(rs.getString(3));
			b.setPrice(rs.getString(4));
			b.setBookCategory(rs.getString(5));
			b.setStatus(rs.getString(6));
			b.setPhoto(rs.getString(7));
			b.setUseremail(rs.getString(8));
			
			list.add(b);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
		return list;
	}

	@Override
	public boolean oldBookDelete(String email, String cate,int id) {
		boolean f =false;
		
		try {
			String sql="delete from book_dtls where bookCategory=? and user_email=? and bookId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, cate);
			ps.setString(2, email);
			ps.setInt(3, id);
			
			int i = ps.executeUpdate();
			
			if (i ==1) {
				f = true; 
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<BookDtls> getBookBySearch(String ch) {
		
		List<BookDtls> list= new ArrayList<BookDtls>();
		 BookDtls b = null;
		 try {
			String sql="select * from book_dtls where bookname like ? or author like ? or bookCategory like ? and status = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%"); 
			ps.setString(2, "%"+ch+"%"); 
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "Active");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUseremail(rs.getString(8));
				
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
			return list;
	}

	
	
	
}
