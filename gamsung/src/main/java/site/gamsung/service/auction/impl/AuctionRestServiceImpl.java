package site.gamsung.service.auction.impl;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import site.gamsung.service.auction.AuctionRestDAO;
import site.gamsung.service.auction.AuctionRestService;
import site.gamsung.service.domain.AuctionProduct;

@Service("auctionRestService")
public class AuctionRestServiceImpl implements AuctionRestService{
	
	@Autowired
	@Qualifier("auctionRestDAO")
	private AuctionRestDAO auctionRestDAO;
	
	public AuctionRestServiceImpl() {
		// TODO Auto-generated constructor stub
	}
	
}
