package com.java.project.crawl.serviceImpl;

import java.util.List;
import java.util.Optional;
import java.util.function.Function;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery.FetchableFluentQuery;
import org.springframework.stereotype.Service;

import com.java.project.crawl.entity.CrawlElementEntity;
import com.java.project.crawl.repository.CrawlElementRepository;
import com.java.project.service.ShareService;

@Service
public class CrawlElementServiceImpl extends ShareService implements CrawlElementRepository {

	@Autowired
	private CrawlElementRepository crawlRepo;

	@Override
	public List<CrawlElementEntity> findAll() {
		return crawlRepo.findAll();
	}

	@Override
	public Optional<CrawlElementEntity> findById(Long id) {
		return crawlRepo.findById(id);
	}
	
	@Override
	public void deleteById(Long id) {
		crawlRepo.deleteById(id);
	}

	@Override
	public List<CrawlElementEntity> findByName(String name) {
		return null;
	}

	
	public CrawlElementEntity updateCrawl(Optional<CrawlElementEntity> crawlEntity) {
		return crawlRepo.save(crawlEntity.get());
	}

	@Override
	public CrawlElementEntity save(CrawlElementEntity crawlEntity) {
		return crawlRepo.save(crawlEntity);
	}

	@Override
	public List<CrawlElementEntity> findAll(Sort sort) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CrawlElementEntity> findAllById(Iterable<Long> ids) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <S extends CrawlElementEntity> List<S> saveAll(Iterable<S> entities) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void flush() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public <S extends CrawlElementEntity> S saveAndFlush(S entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <S extends CrawlElementEntity> List<S> saveAllAndFlush(Iterable<S> entities) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteAllInBatch(Iterable<CrawlElementEntity> entities) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteAllByIdInBatch(Iterable<Long> ids) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteAllInBatch() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public CrawlElementEntity getOne(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CrawlElementEntity getById(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CrawlElementEntity getReferenceById(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <S extends CrawlElementEntity> List<S> findAll(Example<S> example) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <S extends CrawlElementEntity> List<S> findAll(Example<S> example, Sort sort) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<CrawlElementEntity> findAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean existsById(Long id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public long count() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void delete(CrawlElementEntity entity) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteAllById(Iterable<? extends Long> ids) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteAll(Iterable<? extends CrawlElementEntity> entities) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteAll() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public <S extends CrawlElementEntity> Optional<S> findOne(Example<S> example) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <S extends CrawlElementEntity> Page<S> findAll(Example<S> example, Pageable pageable) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <S extends CrawlElementEntity> long count(Example<S> example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public <S extends CrawlElementEntity> boolean exists(Example<S> example) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public <S extends CrawlElementEntity, R> R findBy(Example<S> example,
			Function<FetchableFluentQuery<S>, R> queryFunction) {
		// TODO Auto-generated method stub
		return null;
	}



}
